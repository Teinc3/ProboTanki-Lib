from abc import ABC, abstractmethod
import asyncio
from datetime import datetime, timedelta
from typing import ClassVar, Callable, Awaitable

from ..processing import AsyncAbstractProcessor
from ..networking import AsyncTankiSocket
from ..security import CProtection
from ..communications import AbstractMessage, ErrorMessage
from ...utils import ReconnectionConfig, Address as Proxy


class AsyncTankiInstance(ABC):
    RECONNECTION_CONFIG: ClassVar[ReconnectionConfig]

    processor: AsyncAbstractProcessor
    tankisocket: AsyncTankiSocket

    def __init__(
        self,
        id: int,
        credentials: dict,
        transmit: Callable[[AbstractMessage], Awaitable[None]],
        handle_reconnect: Callable[[], Awaitable[None]],
        on_kill_instance: Callable[[int], Awaitable[None]],
        reconnections: list[datetime]= None
    ):
        if reconnections is None:
            reconnections = []
            
        self.id = id
        self.credentials = credentials
        self.reconnections = reconnections
        self.emergency_halt = asyncio.Event()
        self.handle_reconnect = handle_reconnect
        self.transmit = transmit
        self.on_kill_instance = on_kill_instance
        
        # Create the protection instance if not already provided
        self.protection = CProtection()
        
        # Initialize async components
        self._reconnection_task: asyncio.Task | None = None
        
        # Instantiate processor and socket
        self.instantiate_processor()
        self.instantiate_socket()

    @abstractmethod
    def instantiate_processor(self) -> None:
        """Instantiate the processor for this instance"""
        raise NotImplementedError

    def instantiate_socket(self) -> None:
        """Instantiate the socket for this instance"""

        self.tankisocket = AsyncTankiSocket(
            self.protection,
            self.credentials.get('proxy', None),
            self.emergency_halt,
            self.processor.parse_packet,
            self.on_socket_close
        )
        self.processor.socketinstance = self.tankisocket
    
    async def on_socket_close(
        self,
        e: Exception | str,
        location: str = None,
        state: str = None,
        log_error: bool = True,
        add_to_reconnections: bool = True,
        kill_instance: bool = False
    ):
        """Handle socket close events"""

        if self.emergency_halt.is_set():
            # Already handling reconnection/killing
            return
        
        # Setup the exception
        if isinstance(e, Exception):
            e.add_note("Socket closed")
        else:
            e = Exception(e)
            
        location = location or "[AsyncTankiInstance.on_socket_close]"
        reconnections = [f"<t:{int(reconnection.timestamp())}:R>" for reconnection in self.reconnections]

        username = self.credentials.get('username', 'N/A')
        proxy: Proxy | str = self.credentials.get('proxy', 'N/A')
        if isinstance(proxy, Proxy):
            proxy = f"{proxy.host}:{proxy.port}"
        
        state = f"{state or ''}\n{self.id=} | {username=} | {reconnections=} | {proxy=}"

        # Calculate reconnection time
        if add_to_reconnections:
            break_interval = self.check_reconnection()
        else:
            break_interval = 0
            
        # Add reconnection information to the error
        if break_interval > 0:
            e.add_note(f"Reconnecting in {break_interval} minutes")
        elif break_interval == 0:
            e.add_note("Reconnecting instantly")
            
        # Log error if requested
        if log_error:
            await self.transmit(ErrorMessage(e, location, state))
        
        # Set emergency halt to stop socket processing
        self.emergency_halt.set()
        await self.tankisocket.close_socket()
        
        if kill_instance or break_interval < 0:
            # Kill instance, don't reconnect
            await self.on_kill_instance(self.id)
            return
        
        # Schedule reconnection after delay
        if self._reconnection_task and not self._reconnection_task.done():
            self._reconnection_task.cancel()
            
        # Add a small delay even for "instant" reconnections to avoid thrashing
        if break_interval == 0:
            break_interval = self.RECONNECTION_CONFIG.INSTANT_RECONNECT_INTERVAL / 60
            
        self._reconnection_task = asyncio.create_task(self._reconnect_after_delay(break_interval * 60))
    
    async def _reconnect_after_delay(self, delay_seconds: float):
        """Wait for delay then reconnect"""
        try:
            await asyncio.sleep(delay_seconds)
            await self.handle_reconnect()
        except asyncio.CancelledError:
            pass
    
    def check_reconnection(self) -> float:
        """
        Check and calculate reconnection delay in minutes
        
        Returns:
            float: Minutes to wait before reconnecting. 0 for immediate, negative for no reconnect.
        """
        current_time = datetime.now()
        self.reconnections.append(current_time)
        
        # Filter out old reconnections
        if self.RECONNECTION_CONFIG.RECONNECTION_INTERVAL > 0:
            self.reconnections = list(filter(
                lambda reconnection: reconnection > current_time - timedelta(seconds=self.RECONNECTION_CONFIG.RECONNECTION_INTERVAL),
                self.reconnections
            ))
        
        # If max reconnections is disabled, reconnect immediately
        if self.RECONNECTION_CONFIG.MAX_RECONNECTIONS <= 0:
            return 0
        
        # Check if we hit max reconnections
        if len(self.reconnections) >= self.RECONNECTION_CONFIG.MAX_RECONNECTIONS:
            break_interval = self.RECONNECTION_CONFIG.BREAK_INTERVAL
            if break_interval >= 0:
                return break_interval
            else:
                return -1
                
        # No break needed, reconnect immediately
        return 0
    

__all__ = ['AsyncTankiInstance']