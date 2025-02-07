from ..basecodec import BaseCodec


class ShortCodec(BaseCodec[int]):

    def decode(self):
        return self._buffer.read_short()

    def encode(self, value):
        self._buffer.write_short(value)
        return 2
