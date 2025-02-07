from ..basecodec import BaseCodec

class BoolCodec(BaseCodec[bool]):

    def decode(self):
        return self._buffer.read_boolean()

    def encode(self, value):
        self._buffer.write_boolean(value)
        return 1
