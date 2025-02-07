from ..basecodec import BaseCodec


class ByteCodec(BaseCodec[float]):

    def decode(self):
        return self._buffer.read_byte()

    def encode(self, value):
        self._buffer.write_byte(value)
        return 1
