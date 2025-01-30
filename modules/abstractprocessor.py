import time
from abc import ABC, abstractmethod
from threading import Thread, Lock, Event
from enum import Enum
from typing import Callable

from lib.modules import packetManager, TankiSocket, Protection
from lib.packets import AbstractPacket


class LayoutID(Enum):
    ENTRY = -1
    LOBBY = 0
    GARAGE = 1
    BATTLE = 3

class AbstractProcessor(ABC):
    _current_packet: AbstractPacket

    def __init__(self, socket: TankiSocket, protection: Protection, credentials: dict, log_msg: Callable = None):
        self.socketinstance = socket
        self.protection = protection
        self.credentials = credentials
        self.log_msg = log_msg

        self.layout = LayoutID.ENTRY

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

        elif self.compare_packet('Change_Layout'):
            self.layout = packet_object['layout']
            self.on_layout_change()

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
                self.socketinstance.on_socket_close(Exception("Invite code required"))

        elif self.compare_packet('Login_Ready'):
            self._login()

        elif self.compare_packet('Login_Success'):
            self.on_login()

        elif self.compare_packet('Login_Failed'):
            self.socketinstance.on_socket_close(Exception("Login Failed"))

        elif self.compare_packet('Banned'):
            self.socketinstance.on_socket_close(Exception("Banned"))

        else:
            return False
        
        return True

    def _login(self):
        # Prune everything except username and password and add rememberMe False
        login_data = self.credentials.copy()
        login_data['rememberMe'] = False

        login_packet = packetManager.get_packet_by_name('Login')()
        login_packet.deimplement(login_data)
        self.send_packet(login_packet)

    @abstractmethod
    def on_layout_change(self):
        raise NotImplementedError
    
    @abstractmethod
    def on_login(self):
        raise NotImplementedError

    # Helper Functions
    def compare_packet(self, name: str):
        return packetManager.get_packet_by_name(name) == self.current_packet.__class__

    # Debugging method
    def send_packet(self, packet: AbstractPacket):
        return self.socketinstance.socket.sendall(packet.wrap(self.protection))
    
    def create_timer(self, delta_time: int, callback: callable):
        """Function creates a temporary timer thread that expires after a certain time and executes the callback function"""
        def timer_thread():
            time.sleep(delta_time)
            if self.timer_thread_clearance.is_set():
                return
            try:
                callback()
            except Exception as e:
                self.log(f"Error: {e}")
        
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