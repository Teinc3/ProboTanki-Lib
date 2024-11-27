from abc import ABC, abstractmethod
from threading import Thread, Lock
from typing import ClassVar
import time as Time

from bot.callbackholder import CallbackHolder
from bot.enums import ProcessorIDs
from lib.modules.packetmanager import packetManager
from lib.packets import AbstractPacket
from lib.utils.ebytearray import EByteArray


class AbstractProcessor(ABC):
    processorID: ClassVar[ProcessorIDs]

    _current_packet: AbstractPacket

    def __init__(self, callback_holder: CallbackHolder):
        self.holder = callback_holder
        self.packetManager = packetManager

        self._lock = Lock()

    @abstractmethod
    def process_packets(self):
        raise NotImplementedError

    def parse_packets(self, packet_id: int, packet_data: EByteArray):
        Packet = self.packetManager.get_packet(packet_id)
        if Packet is None:
            return

        self.current_packet = Packet()

        self.current_packet.unwrap(packet_data)
        # if self.holder.watchdog:
        #     print(f"Received packet {self.current_packet.__class__.__name__}: ", str(self.current_packet.object)[0:200])

        if not self._process_universal_packets():
            self.process_packets()

    def _process_universal_packets(self) -> bool:
        packet_object = self.current_packet.object

        if self.compare_packet('Ping'):
            pong_packet = self.packetManager.get_packet_by_name('Pong')()
            self.send_packet(pong_packet)

        elif self.compare_packet('Load_Resources'):
            loaded_packet = self.packetManager.get_packet_by_name('Resources_Loaded')()
            loaded_packet.objects = [self.current_packet.object['callbackID']]  # Lazy deimplement
            self.send_packet(loaded_packet)

        elif self.compare_packet('Change_Layout'):
            if packet_object['layout'] == 0:
                self.holder.swap_processor(ProcessorIDs.P_LOBBY)
            elif packet_object['layout'] == 3:
                self.holder.swap_processor(ProcessorIDs.P_BATTLE)
            
            # Layout 1 is garage

        else:
            return False
        
        return True

    def compare_packet(self, name: str):
        return self.packetManager.get_packet_by_name(name) == self.current_packet.__class__

    # Debugging method
    def send_packet(self, packet: AbstractPacket):
        # if self.holder.watchdog:
        # print(f"Sent packet {packet.__class__.__name__}: ", str(packet.object)[0:200])

        # holder contains a lock, so there should not be race conditions
        return self.holder.socket.sendall(packet.wrap(self.holder.protection))
    
    # Function creates a temporary timer thread that expires after a certain time and sends the packet to the server
    def create_timer(self, time: int, packet: AbstractPacket):
        def timer_thread():
            Time.sleep(time)
            self.send_packet(packet)
        
        timer = Thread(target=timer_thread)
        timer.daemon = True
        timer.start()

    @property
    def current_packet(self) -> AbstractPacket:
        with self._lock:
            return self._current_packet

    @current_packet.setter
    def current_packet(self, packet: AbstractPacket):
        with self._lock:
            self._current_packet = packet
