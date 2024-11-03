import json
import struct

# Расширение bytearray с дополнительными методами (поддержкой кодеков)
# int - 4 байта
# byte - 1 байт
# boolean - 1 байт, значения 1 или 0
# string - 1 байт boolean (пустая ли строка) | длина строки int (4 байта) | самая строка (длинной указанной ранее)
class ByteArray(bytearray):
    
    def read_int(self):
        length = 4
        value = struct.unpack('>i', self[:length])[0]
        for _ in range(length):
            del self[0]
        return value
    
    def write_int(self, value):
        bytes_int = struct.pack('>i', value)
        self.write(bytes_int)
        return self
    
    def read_byte(self):
        value = int.from_bytes(self[:1], byteorder="big", signed=True)
        del self[0]
        return value
    
    def write_byte(self, value):
        byte_value = value.to_bytes(1, byteorder='big', signed=True)
        self.write(byte_value)
        return self

    def read_boolean(self):
        return self.read_byte() != 0

    def write_boolean(self, value: bool):
        self.write_byte(1 if value else 0)
        return self
    
    def write_utf(self, value: str = None):
        if not value:
            self.write_boolean(True)
            return self
        self.write_boolean(False)
        length = len(value)
        self.write_int(length)
        buffer = value.encode('utf-8')
        self.write(buffer)
        return self
        
    def read_utf(self):
        isEmpty = self.read_boolean()
        if isEmpty:
            return None
        length = self.read_int()
        value = self[:length].decode('utf-8')
        for _ in range(length):
            del self[0]
        return value
    
    def read_json(self):
        json_str = self.read_utf()
        data = json.loads(json_str)
        return data
    
    def write_json(self, value):
        json_str = json.dumps(value)
        self.write_utf(json_str)
        return self

    def write(self, value: bytearray):
        self.extend(value)
        return self