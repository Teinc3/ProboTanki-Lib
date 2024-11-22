from abc import ABC, abstractmethod
from typing import Type, ClassVar
from threading import Lock

from lib.packets import AbstractPacket
from lib.modules.packetmanager import packetManager
from lib.utils.ebytearray import EByteArray

from bot.callbackholder import CallbackHolder
from bot.enums import ProcessorIDs


class AbstractProcessor(ABC):
    processorID: ClassVar[ProcessorIDs]

    _current_packet: AbstractPacket
    
    def __init__(self, callback_holder: CallbackHolder):
        self.holder = callback_holder

        self._lock = Lock()

    def parse_packets(self, packet_id: int, packet_data: EByteArray):
        Packet = packetManager.get_packet(packet_id)
        if Packet is None:
            return
        
        self.current_packet = Packet()

        self.current_packet.unwrap(packet_data)
        # if self.holder.watchdog:
        #     print(f"Received packet {self.current_packet.__class__.__name__}: ", str(self.current_packet.object)[0:200])

        if self.compare_packet('Ping'):
            pong_packet = packetManager.get_packet_by_name('Pong')()
            self.send_packet(pong_packet)

        elif self.compare_packet('Load_Resources'):
            loaded_packet = packetManager.get_packet_by_name('Resources_Loaded')()
            loaded_packet.objects = [self.current_packet.object['callbackID']] # Lazy deimplement
            self.send_packet(loaded_packet)
        
        else:
            self.process_packets()
    
    def compare_packet(self, name: str):
        return packetManager.get_packet_by_name(name) == self.current_packet.__class__

    # Debugging method
    def send_packet(self, packet: AbstractPacket):
        #if self.holder.watchdog:
            #print(f"Sent packet {packet.__class__.__name__}: ", str(packet.object)[0:200])
        return self.holder.socket.sendall(packet.wrap(self.holder.protection))

    @abstractmethod
    def process_packets(self):
        raise NotImplementedError
    
    @property
    def current_packet(self) -> AbstractPacket:
        with self._lock:
            return self._current_packet
    
    @current_packet.setter
    def current_packet(self, packet: AbstractPacket):
        with self._lock:
            self._current_packet = packet