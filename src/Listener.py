from codec.EByteArray import EByteArray
from codec.XorProtectionContext import XorProtectionContext
from Logger import Logger
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from Processor import Processor


class Listener:
    PacketHeaderLength = 8

    direction: bool  # IN = True, OUT = False
    current_packet_position: int
    abs_packet_data_array: EByteArray
    data_buffer: EByteArray
    protection: XorProtectionContext
    processor: 'Processor'
    logger: Logger

    def __init__(self, direction, processor):
        self.direction = direction
        self.processor = processor

        self.current_packet_position = 0
        self.abs_packet_data_array = EByteArray()
        self.data_buffer = EByteArray()
        self.protection = XorProtectionContext()
        
        self.logger = Logger()

    @property
    def direction_code(self) -> str:
        return "IN" if self.direction else "OUT"

    def on_socket_data(self, data: bytearray) -> None:        
        data = EByteArray(data)
        data.read_bytes_into(self.data_buffer, len(self.data_buffer), len(data))

        self.logger.log_info(
            f"TCP Packet {self.direction_code} [{len(data)}] | Data: {data[0:max(50, len(data))]} | "
            f"Buffer Start: {self.data_buffer[0:max(50, len(self.data_buffer))]} | Buffer End: {self.data_buffer[-50:]}"
        )

        self.process_data()

    def process_data(self) -> None:
        abs_packet_len: int = 0
        packet_ID: int = 0
        packet_data_len: int = 0

        self.data_buffer.position = self.current_packet_position
        if self.data_buffer.bytes_available == 0:
            self.logger.log_info(f"{self.direction_code} | Buffer is empty")
            return

        while True:
            if self.data_buffer.bytes_available < Listener.PacketHeaderLength:
                self.logger.log_info(
                    f"{self.direction_code} Buffer is too small"
                    f" | Packet Header Length: {Listener.PacketHeaderLength} | Buffer Length: {self.data_buffer.bytes_available}"
                    f" | Buffer: {self.data_buffer}"
                    )
                return

            abs_packet_len = self.data_buffer.read_int()
            packet_ID = self.data_buffer.read_int()
            packet_data_len = abs_packet_len - Listener.PacketHeaderLength

            if self.data_buffer.bytes_available < packet_data_len:
                self.logger.log_info(
                    f"{self.direction_code} Buffer is too small for packet data"
                    f" | Packet Data Length: {packet_data_len} | Buffer Length: {self.data_buffer.bytes_available}"
                    f" | Buffer: {self.data_buffer}"
                )
                return

            if packet_data_len > 0:
                self.data_buffer.read_bytes_into(self.abs_packet_data_array, 0, packet_data_len)

                self.logger.log_info(
                    f"Packet Data: {self.abs_packet_data_array[0:min(50, len(self.abs_packet_data_array))]}"
                    f" | Buffer Start: {self.data_buffer[0:min(50, len(self.data_buffer))]} | Buffer End: {self.data_buffer[-50:]}"
                )

            try:
                self.abs_packet_data_array = self.protection.decrypt(self.abs_packet_data_array, self.direction)
                self.processor.process_packet(self.direction, packet_ID, abs_packet_len, self.abs_packet_data_array)

            except Exception as e:
                self.logger.log_error(
                    f"Error decrypting packet: {e} | Direction: {self.direction_code} "
                    f"| Packet ID: {packet_ID} | Data Buffer: {self.data_buffer}"
                )

            self.abs_packet_data_array.clear()
            if self.data_buffer.bytes_available == 0:
                break

            self.current_packet_position = self.data_buffer.position

        self.data_buffer.clear()
        self.current_packet_position = 0
