from codec.EByteArray import EByteArray
from codec.XorProtectionContext import XorProtectionContext

from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from Processor import Processor

class Listener:
    PacketHeaderLength = 8

    direction: bool # IN = True, OUT = False
    current_packet_position: int
    packet_byte_array: EByteArray
    raw_data_buffer: EByteArray
    data_buffer: EByteArray
    protection: XorProtectionContext
    processor: 'Processor'

    def __init__(self, direction, processor):
        self.direction = direction
        self.processor = processor

        self.current_packet_position = 0
        self.packet_byte_array = EByteArray()
        self.raw_data_buffer = EByteArray()
        self.data_buffer = EByteArray()
        self.protection = XorProtectionContext()

        self.debug = False

    @property
    def direction_code(self) -> str:
        return "IN" if self.direction else "OUT"
    
    def on_socket_data(self, data: bytearray) -> None:
        data = EByteArray(data)
        data.read_bytes_into(self.data_buffer, len(self.data_buffer), len(data))

        self.process_data()

    def process_data(self) -> None:
        current_packet_len: int = 0
        packet_ID: int = 0
        remaining_packet_len: int = 0

        self.data_buffer.position = self.current_packet_position
        if self.data_buffer.bytes_available == 0:
            return
        
        while True:
            if self.data_buffer.bytes_available < Listener.PacketHeaderLength:
                return
            
            current_packet_len = self.data_buffer.read_int()
            packet_ID = self.data_buffer.read_int()
            remaining_packet_len = current_packet_len - Listener.PacketHeaderLength

            #if self.direction and packet_ID == 2094741924: This occurs twice, 1st time is ok, 2nd time screws us up

            if self.data_buffer.bytes_available < remaining_packet_len:
                return
            
            if remaining_packet_len > 0:
                self.data_buffer.read_bytes_into(self.packet_byte_array, 0, remaining_packet_len)
                
            try:
                self.packet_byte_array = self.protection.decrypt(self.packet_byte_array, self.direction)
                self.processor.process_packet(self.direction, packet_ID, current_packet_len, self.packet_byte_array)

            except Exception as e:
                print(f"Error decrypting packet: {e} | {self.direction_code} | {packet_ID} | {self.data_buffer} |")

            self.packet_byte_array.clear()
            if self.data_buffer.bytes_available == 0:
                break

            self.current_packet_position = self.data_buffer.position

        self.data_buffer.clear()
        self.current_packet_position = 0