from typing import Tuple

from codec.base import BaseCodec
from codec.primitive import IntCodec


class DoubleIntCodec(BaseCodec[Tuple[int, int]]):

    def decode(self):
        return (IntCodec(self._buffer).decode(), IntCodec(self._buffer).decode())

    def encode(self, value):
        IntCodec(self._buffer, value[0]).encode()
        IntCodec(self._buffer, value[1]).encode()
        return 8