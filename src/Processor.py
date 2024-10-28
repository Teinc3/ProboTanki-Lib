from codec.EByteArray import EByteArray
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from main import Manager

class Processor:
    def __init__(self, manager: 'Manager'):
        self.manager = manager

    def process_packet(self, direction: bool, packet_ID: int, packet_len: int, data: EByteArray):
        if direction and packet_ID == 2001736388:
            self.manager.listeners["in"].protection.activate(data)
            self.manager.listeners["out"].protection.activate(data)
        
        if packet_len > 8:
            print(
                f"{'IN' if direction else 'OUT'} [{packet_len}] | Packet ID: {packet_ID} "
                f"| Data: {'Data Too Big!' if packet_len >= 300 else str(data)}"
            )
        
