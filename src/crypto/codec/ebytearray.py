import struct
from typing import Optional


class EByteArray(bytearray):

    def _read_value(self, packet_format: str):
        length = struct.calcsize(packet_format)
        value = struct.unpack(packet_format, self[:length])[0]
        del self[:length]  # Deletes the bytes read, cleaning up the code
        return value

    def write(self, value: bytes) -> "EByteArray":
        self.extend(value)
        return self

    def read_int(self) -> int:
        return self._read_value('>i')

    def read_byte(self) -> int:
        return self._read_value('b')

    def read_boolean(self) -> bool:
        return self.read_byte() != 0

    def read_float(self) -> float:
        return self._read_value('>f')

    def write_int(self, value: int) -> "EByteArray":
        bytes_int = struct.pack('>i', value)
        self.write(bytes_int)
        return self

    def write_byte(self, value: int) -> "EByteArray":
        bytes_byte = struct.pack('b', value)
        self.write(bytes_byte)
        return self

    def write_boolean(self, value: bool) -> "EByteArray":
        self.write_byte(1 if value else 0)
        return self

    def write_float(self, value: float) -> "EByteArray":
        bytes_float = struct.pack('>f', value)
        self.write(bytes_float)
        return self

    def write_string(self, value: str = None) -> "EByteArray":
        if not value:
            self.write_boolean(True)
            return self
        self.write_boolean(False)
        length = len(value)
        self.write_int(length)
        buffer = value.encode('utf-8')
        self.write(buffer)
        return self

    def read_string(self) -> Optional[str]:
        isEmpty = self.read_boolean()
        if isEmpty:
            return None
        length = self.read_int()
        value = self[:length].decode('utf-8')
        del self[:length]  # Deletes the bytes read
        return value

    def trim(self, trim_length=300) -> "EByteArray":
        """
        Trims the packet data for display.
        If length ≤ trim_length bytes, displays the entire packet.
        If length > trim_length bytes, displays the first 150 and last 150 bytes.
        """
        if len(self) <= trim_length:
            return self
        else:
            return EByteArray(self[:150] + b'...' + self[-150:])
