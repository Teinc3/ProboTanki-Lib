from abc import ABC, abstractmethod
import time
from datetime import datetime, timedelta
from threading import Event
from typing import ClassVar, Callable

from ..processing import AbstractProcessor
from ..networking import TankiSocket
from ..security import CProtection
from ..communications import AbstractMessage, ErrorMessage
from ...utils import ReconnectionConfig


class TankiInstance(ABC):
    RECONNECTION_CONFIG: ClassVar[ReconnectionConfig]

    processor: AbstractProcessor
    tankisocket: TankiSocket

    def __init__(
        self,
        id: int,
        credentials: dict,
        transmit: Callable[[AbstractMessage], None],
        handle_reconnect: Callable[[], None],
        on_kill_instance: Callable[[int], None],
        reconnections: list[float] = None
    ):
        
        if reconnections is None:
            reconnections = []
        self.id = id # Just for identification/debugging purposes
        self.credentials = credentials

        self.reconnections = reconnections
        self.emergency_halt = Event()
        self.handle_reconnect = handle_reconnect
        self.transmit = transmit
        self.on_kill_instance = on_kill_instance

        if not hasattr(self, 'protection'):
            self.protection = CProtection() # Just for you, proxy
        
        self.instantiate_processor()
        self.instantiate_socket()

    @abstractmethod
    def instantiate_processor(self):
        """
        Instantiate the processor for the TankiInstance.
        As different types of instances will need different processors, this method is abstract.
        """
        return NotImplementedError()

    def instantiate_socket(self):
        self.tankisocket = TankiSocket(
            self.protection,
            self.credentials.get('proxy', None),
            self.emergency_halt,
            self.processor.parse_packets,
            self.on_socket_close
        )
        self.processor.socketinstance = self.tankisocket

    def on_socket_close(
        self,
        e: Exception | str,
        location: str = None,
        state: str = None,
        log_error: bool = True,
        add_to_reconnections: bool = True,
        kill_instance: bool = False
    ):

        # Setup the exception
        if isinstance(e, Exception):
            e.add_note("Socket closed")
        else:
            e = Exception(e)
        location = location or "[TankiInstance.on_socket_close]"
        reconnections = [f"<t:{int(reconnection.timestamp())}:R>" for reconnection in self.reconnections]
        state += f"\nID: {self.id} | Credentials: {self.credentials} | Previous reconnections: {reconnections}"
        
        # Get the break interval before sending error message
        if add_to_reconnections:
            break_interval = self.check_reconnection()
        else:
            break_interval = 0
            
        # Add reconnection information to the error
        if break_interval > 0:
            e.add_note(f"Reconnecting in {break_interval} minutes")
        elif break_interval == 0:
            e.add_note("Reconnecting instantly")
            
        # Now send the complete error message
        if log_error:
            self.transmit(ErrorMessage(e, location, state))
        
        # Cleanup the existing socket
        self.emergency_halt.set()
        self.tankisocket.socket.close()

        if kill_instance or break_interval < 0:
            # Kill instance, don't reconnect
            self.on_kill_instance(self.id)
            return
        
        if break_interval == 0:
            break_interval += self.RECONNECTION_CONFIG.INSTANT_RECONNECT_INTERVAL / 60 # Add 5 seconds to the break interval to prevent reconnecting too fast - proxy may send shit data
        time.sleep(break_interval * 60)
        
        self.handle_reconnect()

    def check_reconnection(self) -> float:
        """
        Check if the socket should be reconnected, and if so, the number of minutes to wait before reconnecting (ie. break interval).

        Returns:
            float: Number of minutes to wait before reconnecting. 0 means no wait. Negative value means no reconnect.
        """
        current_time = datetime.now()
        self.reconnections.append(current_time)

        if self.RECONNECTION_CONFIG.RECONNECTION_INTERVAL > 0:
            # Remove reconnections that are older than the reconnection interval
            self.reconnections = list(filter(
                lambda reconnection: reconnection > current_time - timedelta(seconds=self.RECONNECTION_CONFIG.RECONNECTION_INTERVAL),
                self.reconnections
            ))

        if self.RECONNECTION_CONFIG.MAX_RECONNECTIONS <= 0:
            return 0
        
        if len(self.reconnections) >= self.RECONNECTION_CONFIG.MAX_RECONNECTIONS:
            break_interval = self.RECONNECTION_CONFIG.BREAK_INTERVAL
            if break_interval >= 0:
                return break_interval
            else: 
                return -1
            
        # No break interval, instant reconnect
        return 0
    
__all__ = ['TankiInstance']