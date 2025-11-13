from ..basecodec import BaseCodec


class LongCodec(BaseCodec[int]):

    def decode(self):
        return self._buffer.read_long()

    def encode(self, value):
        self._buffer.write_long(value)
        return 8
    
    
__all__ = ['LongCodec']