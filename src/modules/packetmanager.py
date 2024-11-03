import inspect
from typing import Type

import packets
from packets.abstractpacket import AbstractPacket


class PacketManager:
    # Dictionary to store packet classes by their IDs
    packets = {}

    @classmethod
    def load_packets(cls):
        # Iterate over all modules in the packets package
        for _, module in inspect.getmembers(packets, inspect.ismodule):
            # Iterate over all attributes in the module
            for _, obj in inspect.getmembers(module, inspect.isclass):
                # Check if the class has an 'id' attribute
                if hasattr(obj, 'id'):
                    cls.packets[obj.id] = obj

    @classmethod
    def get_packet(cls, packet_id: int) -> Type[AbstractPacket] | None:
        return cls.packets.get(packet_id, None)

    @classmethod
    def get_name(cls, packet_id: int) -> str:
        packet_class = cls.get_packet(packet_id)
        return packet_class.__name__ if packet_class else "Unknown"


# Load all packet classes into the PacketManager
PacketManager.load_packets()
