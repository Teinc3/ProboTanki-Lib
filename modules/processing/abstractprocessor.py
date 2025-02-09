import time
from abc import ABC, abstractmethod
from threading import Thread, Lock, Event
from typing import Callable

from ..misc import packetManager
from ..networking import TankiSocket
from ..security import Protection
from ..communications import AbstractMessage, ErrorMessage
from ...packets import AbstractPacket
from ...utils.enums import AutoEnum


class AbstractProcessor(ABC):
    _current_packet: AbstractPacket
    command_handlers: dict[AutoEnum, Callable[[dict], None]] # Just a placeholder

    def __init__(self, socket: TankiSocket, protection: Protection, credentials: dict, transmit: Callable[[AbstractMessage], None]):

        self.socketinstance = socket
        self.protection = protection
        self.credentials = credentials
        self.transmit = transmit

        self.timer_thread_clearance = Event()
        self.threads: set[Thread] = set()

        self._packet_lock = Lock()

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

    @abstractmethod
    def process_packets(self):
        # In the corresponding processor class, this will be for other packets
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
            loaded_packet.objects = [self.current_packet.object['callbackID']]  # Lazy deimplement
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
            self.close_socket("Login Failed")

        elif self.compare_packet('Banned'):
            self.close_socket("Account Banned")

        else:
            return False
        
        return True
    
    @abstractmethod
    def on_login(self):
        raise NotImplementedError

    # Helper Functions
    def compare_packet(self, name: str):
        return packetManager.get_packet_by_name(name) == self.current_packet.__class__

    def send_packet(self, packet: AbstractPacket):
        wrapped_data = packet.wrap(self.protection)
        return self.socketinstance.socket.sendall(wrapped_data)
    
    def close_socket(self, reason: str):
        # Form the error message
        reason = f"Unexpected packet interaction: {reason}"
        self.socketinstance.on_socket_close(reason, self.__class__.__name__, f"Current Packet: {self.current_packet}")
    
    def create_timer(self, delta_time: int, callback: callable):
        """Function creates a temporary timer thread that expires after a certain time and executes the callback function"""
        def timer_thread():
            time.sleep(delta_time)
            if self.timer_thread_clearance.is_set():
                return
            try:
                callback()
            except Exception as e:
                message = ErrorMessage(e, location=f"{self.__class__.__name__}.create_timer.callback", state=f"Delta Time: {delta_time} | Callback: {repr(callback)}")
                self.transmit(message)
                        
        timer = Thread(target=timer_thread)
        timer.daemon = True
        timer.start()
        self.threads.add(timer)

    def create_packet_timer(self, delta_time: int, packet: AbstractPacket):
        self.create_timer(delta_time, lambda: self.send_packet(packet))

    def kill_timer_threads(self):
        self.timer_thread_clearance.clear()

        for thread in self.threads:
            thread.join()
        
        self.threads.clear()

__all__ = ['AbstractProcessor']