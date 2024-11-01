from typing import Type, ClassVar

from . import BaseCodec


class CustomBaseCodec(BaseCodec[dict]):
    attributes: ClassVar[list[str]] = []
    codecs: ClassVar[list[Type[BaseCodec]]] = []

    # Override these methods if necessary
    def decode(self):
        return {self.attributes[i]: self.codecs[i](self._buffer).decode() for i in range(len(self.codecs))}
    
    def encode(self, value):
        data_len = 0
        for i in range(len(self.codecs)):
            data_len += self.codecs[i](self._buffer).encode(value[self.attributes[i]])
        return data_len