from ..basecodec import BaseCodec


class IntCodec(BaseCodec[int]):

    def decode(self):
        return self._buffer.read_int()

    def encode(self, value):
        self._buffer.write_int(value)
        return 4
