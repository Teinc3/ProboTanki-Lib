import inspect
from typing import Type, TYPE_CHECKING

from ... import packets
if TYPE_CHECKING:
    from ...packets import AbstractPacket


class PacketManager:
    _instance = None

    _packets: dict[int, Type['AbstractPacket']]
    _name_to_packet: dict[str, Type['AbstractPacket']]
    _hidden_packets: list[Type['AbstractPacket']]

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(PacketManager, cls).__new__(cls)
            cls._instance._packets = {}
            cls._instance.load_packets()
        return cls._instance

    def load_packets(self):
        for _, module in inspect.getmembers(packets, inspect.ismodule):
            for _, cls in inspect.getmembers(module, inspect.isclass):
                if hasattr(cls, 'id') and hasattr(cls, 'description'):
                    self._packets[cls.id] = cls

        self._name_to_packet = { Packet.__name__: Packet for Packet in self._packets.values() }
        self._hidden_packets = [Packet for Packet in self._packets.values() if not Packet.shouldLog]

        print(f"Loaded {len(self._packets)} packets")

    def get_packet(self, packet_id: int) -> Type['AbstractPacket'] | None:
        return self._packets.get(packet_id, None)

    def get_packet_by_name(self, packet_name: str) -> Type['AbstractPacket'] | None:
        return self._name_to_packet.get(packet_name, None)

    def get_name(self, packet_id: int) -> str:
        packet_class = self.get_packet(packet_id)
        return packet_class.__name__ if packet_class else "Unknown"


packetManager = PacketManager()
