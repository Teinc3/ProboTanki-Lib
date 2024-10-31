import json
import struct

# Extending bytearray with additional methods (codec support)
# int - 4 bytes
# byte - 1 byte
# boolean - 1 byte, either 1 or 0
# string - 1 byte boolean (is empty?) + 4 byte int (string length) + the string itself
class EByteArray(bytearray):

    def _read_value(self, format: str):
        length = struct.calcsize(format)
        value = struct.unpack(format, self[:length])[0]
        for _ in range(length):
            del self[0]
        return value
    
    def write(self, value: bytearray):
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
    
    def write_int(self, value):
        bytes_int = struct.pack('>i', value)
        self.write(bytes_int)
        return self
    
    def write_byte(self, value):
        #byte_value = value.to_bytes(1, byteorder='big', signed=True)
        bytes_byte = struct.pack('b', value)
        self.write(bytes_byte)
        return self
    
    def write_boolean(self, value: bool):
        self.write_byte(1 if value else 0)
        return self
    
    def write_float(self, value):
        bytes_float = struct.pack('>f', value)
        self.write(bytes_float)
        return self
    
    def write_string(self, value: str = None):
        if not value:
            self.write_boolean(True)
            return self
        self.write_boolean(False)
        length = len(value)
        self.write_int(length)
        buffer = value.encode('utf-8')
        self.write(buffer)
        return self
        
    def read_string(self):
        isEmpty = self.read_boolean()
        if isEmpty:
            return None
        length = self.read_int()
        value = self[:length].decode('utf-8')
        for _ in range(length):
            del self[0]
        return value
    
    def trim(self, trim_length=300):
        """
        Displays packet data based on its length.
        - If length ≤ trim_length bytes, display the entire packet.
        - If length > trim_length bytes, display the first 150 and last 150 bytes.
        
        Args:
            trim_length (int): The length of the packet data to display.
        """

        if len(self) <= trim_length:
            return self
        else:
            return EByteArray(self[:150] + b'...' + self[-150:])

