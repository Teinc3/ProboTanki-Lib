from ..basecodec import BaseCodec


class FloatCodec(BaseCodec[float]):

    def decode(self):
        return self._buffer.read_float()

    def encode(self, value):
        self._buffer.write_float(value)
        return 4
