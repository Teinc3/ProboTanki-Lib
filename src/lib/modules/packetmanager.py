import inspect
from typing import Type, TYPE_CHECKING

import packets
if TYPE_CHECKING:
    from packets import AbstractPacket


class PacketManager:
    _instance = None

    packets: dict[int, Type['AbstractPacket']]
    hidden_packets: list[Type['AbstractPacket']]

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(PacketManager, cls).__new__(cls)
            cls._instance.packets = {}
            cls._instance.load_packets()
        return cls._instance

    def load_packets(self):
        for _, module in inspect.getmembers(packets, inspect.ismodule):
            for _, obj in inspect.getmembers(module, inspect.isclass):
                if hasattr(obj, 'id'):
                    self.packets[obj.id] = obj

        self.hidden_packets = [packet for packet in self.packets.values() if not packet.shouldLog]

        # if len(self.packets) == 0:
        #     raise Exception("No packets loaded")

    def get_packet(self, packet_id: int) -> Type['AbstractPacket'] | None:
        return self.packets.get(packet_id)

    def get_packet_by_name(self, packet_name: str) -> Type['AbstractPacket'] | None:
        for packet in self.packets.values():
            if packet.__name__ == packet_name:
                return packet
        return None

    def get_name(self, packet_id: int) -> str:
        packet_class = self.get_packet(packet_id)
        return packet_class.__name__ if packet_class else "Unknown"


packetManager = PacketManager()
