from abc import ABC, abstractmethod
import asyncio
from typing import Callable, Awaitable, Any, TypeVar, Generic, overload
from enum import Enum

from ..misc import packetManager
from ..networking import AsyncTankiSocket
from ..security import CProtection
from ..communications import AbstractMessage, ErrorMessage, CommandMessage
from ...packets import AbstractPacket


CommandsType = TypeVar('CommandsType', bound=Enum)
CommandBaseClass = TypeVar('CommandBaseClass', bound=CommandMessage)

class AsyncAbstractProcessor(ABC, Generic[CommandsType, CommandBaseClass]):
    """Asynchronous version of AbstractProcessor"""

    current_packet: AbstractPacket # Its ok to not initialise this as it will always be set at the start of triaging
    
    def __init__(
        self,
        socket: AsyncTankiSocket | None,
        protection: CProtection,
        credentials: dict,
        transmit: Callable[[AbstractMessage], Awaitable[None]]
    ):
        self.socketinstance = socket
        self.protection = protection
        self.credentials = credentials
        self.transmit = transmit
        
        self._active_tasks: set[asyncio.Task] = set()

    
    @property
    @abstractmethod
    def command_handlers(self) -> dict[CommandsType, Callable[[CommandBaseClass], Awaitable[Any]]]:
        """Return a dict mapping commands to their handlers."""
        raise NotImplementedError

    
    @abstractmethod
    async def process_packets(self):
        """Process non-universal, non-entry packets"""
        raise NotImplementedError
    
    @abstractmethod
    async def on_login(self):
        """Handle successful login"""
        raise NotImplementedError
    

    async def parse_packet(self, packet: AbstractPacket):
        """Parse and process incoming packet"""
        self.current_packet = packet
        
        # Try universal and entry packets first
        if not await self._process_universal_packets() and not await self._process_entry_packets():
            await self.process_packets()
    

    async def _process_universal_packets(self) -> bool:
        """Process universal packets that all processors handle the same way"""

        if not self.current_packet:
            return False
            
        packet_object = self.current_packet.object
        
        if self.compare_packet('Ping'):
            pong_packet = packetManager.get_packet_by_name('Pong')()
            await self.send_packet(pong_packet)
            return True
            
        elif self.compare_packet('Load_Resources'):
            loaded_packet = packetManager.get_packet_by_name('Resources_Loaded')()
            loaded_packet.objects = [packet_object['callbackID']]
            await self.send_packet(loaded_packet)
            return True
            
        return False
    
    async def _process_entry_packets(self) -> bool:
        """Process entry packets common to most processors"""

        if not self.current_packet:
            return False
            
        packet_object = self.current_packet.object
        
        if self.compare_packet('Activate_Protection'):
            self.protection.activate(packet_object['keys'])
            return True
            
        elif self.compare_packet('Set_Captcha_Keys'):
            client_lang_packet = packetManager.get_packet_by_name('Set_Client_Lang')()
            client_lang_packet.objects = ['en']
            await self.send_packet(client_lang_packet)
            return True
            
        elif self.compare_packet('Invite_Code_Status'):
            if packet_object['inviteEnabled']:
                await self.close_socket("Invite code required")
            return True
            
        elif self.compare_packet('Login_Success'):
            await self.on_login()
            return True
            
        elif self.compare_packet('Login_Failed'):
            await self.close_socket("Login Failed", add_to_reconnections=False, kill_instance=True)
            return True
            
        elif self.compare_packet('Banned'):
            await self.close_socket("Account Banned", add_to_reconnections=False, kill_instance=True)
            return True
            
        return False
    

    def compare_packet(self, name: str) -> bool:
        """Check if current packet matches the given name"""

        if not self.current_packet:
            return False
        return self.current_packet.__class__.__name__ == name
    
    async def send_packets(self, packets: list[AbstractPacket]):
        """Send multiple packets to the server under a single batch"""

        if not self.socketinstance:
            return
        
        packets_data = []
        for packet in packets:
            wrapped_data = packet.wrap(protection=self.protection)
            packets_data.append(wrapped_data)
        
        try:
            await self.socketinstance.send_batch(packets_data)
        except Exception:
            # Silently ignore sending errors - socket will handle them
            pass
    
    async def send_packet(self, packet: AbstractPacket):
        """Send a packet to the server"""

        # Check for valid socket
        if not self.socketinstance:
            return
        
        # Wrap and send packet
        wrapped_data = packet.wrap(protection=self.protection)
        try:
            await self.socketinstance.send(wrapped_data)
        except Exception:
            # Silently ignore sending errors - socket will handle them
            pass
    
    
    async def close_socket(
        self,
        reason: str,
        log_error: bool = True,
        add_to_reconnections: bool = True,
        kill_instance: bool = False
    ):
        """Request socket closure"""

        if not self.socketinstance:
            return
            
        # Format reason
        formatted_reason = f"Closing socket: {reason}"
        if not add_to_reconnections:
            formatted_reason += ", ignoring reconnections"
        if kill_instance:
            formatted_reason += ", killing instance"
        
        # Forward to socket's close handler
        await self.socketinstance.on_socket_close(
            formatted_reason,
            self.__class__.__name__,
            f"Current Packet: {self.current_packet}",
            log_error,
            add_to_reconnections,
            kill_instance
        )
    

    @overload
    async def schedule_task(self, delay: float, coro: Awaitable[Any]) -> asyncio.Task: ...
    @overload
    async def schedule_task(self, delay: float, callback: Callable[..., Awaitable[Any]], *args, **kwargs) -> asyncio.Task: ...
    
    async def schedule_task(self, delay: float, callback_or_coro, *args, **kwargs) -> asyncio.Task:
        """
        Schedule a task to run after delay without blocking the event loop.

        When additional positional or keyword arguments are provided,
        callback_or_coro is treated as a callback function.
        Otherwise, it is treated as an awaitable coroutine.
        """
        
        async def wrapped_task():
            try:
                await asyncio.sleep(delay)
                if callable(callback_or_coro):
                    # Treat as a callback function
                    result = callback_or_coro(*args, **kwargs)
                    if asyncio.iscoroutine(result):
                        await result
                else:
                    # Treat as an awaitable coroutine
                    await callback_or_coro
            except asyncio.CancelledError:
                pass
            except Exception as e:
                await self.transmit(ErrorMessage(
                    e,
                    location=f"{self.__class__.__name__}.schedule_task",
                    state=f"Delta Time: {delay} | Callback: {callback_or_coro.__name__ if callable(callback_or_coro) else callback_or_coro}"
                ))
            finally:
                self._active_tasks.discard(asyncio.current_task())
        
        task_name = f"Task-{self.__class__.__name__}-"
        task_name += callback_or_coro.__name__ if callable(callback_or_coro) else "anonymous"
        task = asyncio.create_task(wrapped_task(), name=task_name)
        self._active_tasks.add(task)
        return task
    
    async def schedule_packet(self, delay: float, packet: AbstractPacket):
        """Schedule a packet to be sent after delay without blocking the event loop"""

        return await self.schedule_task(
            delay,
            self.send_packet,
            packet
        )
    
    async def cancel_all_tasks(self):
        """Cancel all scheduled tasks"""

        tasks = list(self._active_tasks)
        for task in tasks:
            if not task.done():
                task.cancel()
        
        # Wait for tasks to be cancelled
        if tasks:
            await asyncio.gather(*tasks, return_exceptions=True)
        
        self._active_tasks.clear()


__all__ = ['AsyncAbstractProcessor']