from abc import ABC, abstractmethod
from typing import Type


from lib.packets import AbstractPacket
from lib.modules.packetmanager import packetManager
from lib.utils.ebytearray import EByteArray
from bot.callbackholder import CallbackHolder

class AbstractProcessor(ABC):

    current_packet: AbstractPacket
    current_packet_class: Type[AbstractPacket]

    def __init__(self, callback_holder: CallbackHolder):
        self.holder = callback_holder

    def parse_packets(self, packet_id: int, packet_data: EByteArray):
        Packet = packetManager.get_packet(packet_id)
        if Packet is None:
            return
        
        self.current_packet_class = Packet
        self.current_packet = Packet()

        packet_len = len(packet_data)
        data = self.current_packet.unwrap(packet_data)

        print(f"{Packet.__name__} [{packet_len}]: {str(data)[0:min(300, len(str(data)))]}")

        self.process_packets()
    
    def compare_packet(self, name: str):
        return packetManager.get_packet_by_name(name) == self.current_packet_class

    @abstractmethod
    def process_packets(self):
        raise NotImplementedError