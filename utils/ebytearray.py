import struct


class EByteArray(bytearray):

    def _read_value(self, packet_format: str):
        length = struct.calcsize(packet_format)
        value = struct.unpack(packet_format, self[:length])[0]
        del self[:length]  # Deletes the bytes read, cleaning up the code
        return value

    def write(self, value: bytes):
        self.extend(value)
        return self

    def read_int(self) -> int:
        return self._read_value('>i')

    def read_byte(self) -> int:
        return self._read_value('b')

    def read_boolean(self) -> bool:
        return self.read_byte() != 0
    
    def read_long(self) -> int:
        return self._read_value('>q')

    def read_short(self) -> int:
        return self._read_value('>h')

    def read_float(self) -> float:
        return self._read_value('>f')

    def read_string(self, length: int) -> str:
        value = self[:length].decode('utf-8')
        del self[:length]  # Deletes the bytes read
        return value

    def write_int(self, value: int):
        bytes_int = struct.pack('>i', value)
        self.write(bytes_int)
        return self

    def write_byte(self, value: int):
        bytes_byte = struct.pack('b', value)
        self.write(bytes_byte)
        return self

    def write_boolean(self, value: bool):
        self.write_byte(1 if value else 0)
        return self
    
    def write_long(self, value: int):
        bytes_long = struct.pack('>q', value)
        self.write(bytes_long)
        return self

    def write_short(self, value: int):
        if value < -32768 or value > 32767:
            raise ValueError('Short value out of range')

        bytes_short = struct.pack('>h', value)
        self.write(bytes_short)
        return self

    def write_float(self, value: float):
        bytes_float = struct.pack('>f', value)
        self.write(bytes_float)
        return self

    def write_string(self, value: str):
        buffer = value.encode('utf-8')
        self.write(buffer)
        return self

    def trim(self, trim_length=300):
        """
        Trims the packet data for display.
        If length ≤ trim_length bytes, displays the entire packet.
        If length > trim_length bytes, displays the first 150 and last 150 bytes.
        """
        if len(self) <= trim_length:
            return self
        else:
            return EByteArray(self[:150] + b'...' + self[-150:])
