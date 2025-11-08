from abc import ABC, abstractmethod
from threading import Lock, Timer
from enum import Enum
from typing import Callable, Any, TypeVar, Generic

from ..misc import packetManager
from ..networking import TankiSocket
from ..security import CProtection
from ..communications import AbstractMessage, ErrorMessage, CommandMessage
from ...packets import AbstractPacket


CommandsType = TypeVar('CommandsType', bound=Enum)
CommandBaseClass = TypeVar('CommandBaseClass', bound=CommandMessage)

class AbstractProcessor(ABC, Generic[CommandsType, CommandBaseClass]):
    """
    Abstract base class for all tanki processors. Will be phased out in the future.
    """

    _current_packet: AbstractPacket
    s2c_proxy: bool = False  # Indicates if the client is a S2C proxy

    def __init__(
        self,
        socket: TankiSocket,
        protection: CProtection,
        credentials: dict,
        transmit: Callable[[AbstractMessage], None]
    ):

        self.socketinstance = socket
        self.protection = protection
        self.credentials = credentials
        self.transmit = transmit

        self.timers: set[Timer] = set()

        self._packet_lock = Lock()
        self._send_lock = Lock()

        #Reserve for future usage(?)
        # self.packet_handlers: dict[str, Callable[['AbstractProcessor', AbstractPacket], None]] = {
        #     **UNIVERSAL_DISPATCH,
        #     **ENTRY_DISPATCH,
        # }

    @property
    def current_packet(self) -> AbstractPacket:
        with self._packet_lock:
            return self._current_packet

    @current_packet.setter
    def current_packet(self, packet: AbstractPacket):
        with self._packet_lock:
            self._current_packet = packet

    @property
    @abstractmethod
    def command_handlers(self) -> dict[CommandsType, Callable[[CommandBaseClass], Any]]:
        """Return a dict mapping commands to their handlers."""
        raise NotImplementedError


    @abstractmethod
    def process_packets(self):
        # In the corresponding processor class, this will be for other packets
        raise NotImplementedError
    
    @abstractmethod
    def on_login(self):
        raise NotImplementedError


    def parse_packets(self, packet: AbstractPacket):
        self.current_packet = packet

        if not self._process_universal_packets() and not self._process_entry_packets():
            self.process_packets()


    def _process_universal_packets(self) -> bool:
        """
        Processes universal packets that yield the same result for all processors.
        """
        packet_object = self.current_packet.object

        if self.compare_packet('Ping'):
            pong_packet = packetManager.get_packet_by_name('Pong')()
            self.send_packet(pong_packet)

        elif self.compare_packet('Load_Resources'):
            loaded_packet = packetManager.get_packet_by_name('Resources_Loaded')()
            loaded_packet.objects = [packet_object['callbackID']]  # Lazy deimplement
            self.send_packet(loaded_packet)

        else:
            return False
        
        return True
    
    def _process_entry_packets(self) -> bool:
        packet_object = self.current_packet.object

        if self.compare_packet('Activate_Protection'):
            self.protection.activate(packet_object['keys'])

        elif self.compare_packet('Set_Captcha_Keys'):
            client_lang_packet = packetManager.get_packet_by_name('Set_Client_Lang')()
            client_lang_packet.objects = ['en']
            self.send_packet(client_lang_packet)

        elif self.compare_packet('Invite_Code_Status'):
            if packet_object['inviteEnabled']:
                self.close_socket("Invite code required")

        elif self.compare_packet('Login_Success'):
            self.on_login()

        elif self.compare_packet('Login_Failed'):
            self.close_socket("Login Failed", add_to_reconnections=False, kill_instance=True)

        elif self.compare_packet('Banned'):
            self.close_socket("Account Banned", add_to_reconnections=False, kill_instance=True)

        else:
            return False
        
        return True
    

    # Helper Functions
    def compare_packet(self, name: str):
        return packetManager.get_packet_by_name(name) == self.current_packet.__class__

    def send_packet(self, packet: AbstractPacket):
        with self._send_lock:
            wrapped_data = packet.wrap(protection=self.protection, s2c_proxy=self.s2c_proxy)
            try:
                return self.socketinstance.socket.sendall(wrapped_data)
            except:
                #self.close_socket(f"Failed to send packet {packet.__class__.__name__} | Error: {e}")
                pass # Don't waste our time with this shit
    
    def close_socket(self, reason: str, log_error: bool = True, add_to_reconnections: bool = True, kill_instance: bool = False):
        # Form the error message
        reason = f"Closing socket: {reason}"
        if add_to_reconnections:
            reason += ", ignoring reconnections"
        if kill_instance:
            reason += ", killing instance"

        # We just take advantage of socketinstance getting this property from callbacks
        # This function is in TankiInstance and injected into TankiSocket
        self.socketinstance.on_socket_close(
            reason,
            self.__class__.__name__,
            f"Current Packet: {self.current_packet}",
            log_error,
            add_to_reconnections,
            kill_instance
        )
    
    
    def create_timer(self, delta_time: float, callback: Callable[[], None]):
        """Function creates a temporary timer thread that expires after a certain time and executes the callback function"""

        def wrapped_callback():
            try:
                callback()
            except Exception as e:
                self.transmit(ErrorMessage(
                    e,
                    location=f"{self.__class__.__name__}.create_timer.callback", 
                    state=f"Delta Time: {delta_time} | Callback: {repr(callback)}"
                ))
        
        timer = Timer(delta_time, wrapped_callback)
        timer.daemon = True
        timer.name = f"Timer-{self.__class__.__name__}-{callback.__name__}"  # Named timers help with debugging
        timer.start()
        self.timers.add(timer)
        return timer  # Return to allow direct cancellation

    def create_packet_timer(self, delta_time: int, packet: AbstractPacket):
        self.create_timer(delta_time, lambda: self.send_packet(packet))

    def kill_timer_threads(self):
        for timer in self.timers:
            timer.cancel()
        
        self.timers.clear()


__all__ = ['AbstractProcessor']