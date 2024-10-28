class EByteArray(bytearray):
    def __init__(self, data: bytearray = bytearray()):
        super().__init__(data)
        self.position = 0

    @property
    def bytes_available(self) -> int:
        return len(self) - self.position
    
    def read_bytes(self, length: int) -> bytearray:
        try:
            temp = self[self.position:self.position + length]
            self.position += length
            return temp
        except IndexError:
            raise EOFError("Not enough bytes available to read")
        
    def read_bytes_into(self, buffer: bytearray, offset: int = 0, length: int = 0) -> None:
        try:
            buffer[offset:offset + length] = self.read_bytes(length)
        except IndexError:
            raise EOFError("Not enough bytes available to read")
        except ValueError:
            raise ValueError("Invalid offset")

    def read_int(self, signed=True) -> int:
        value = int.from_bytes(self.read_bytes(4), signed=signed)
        return value
    
    def clear(self) -> None:
        self.position = 0
        return super().clear()
