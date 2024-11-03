from typing import Type, ClassVar

from . import BaseCodec
from ..primitive import BoolCodec


class CustomBaseCodec(BaseCodec[dict]):
    attributes: ClassVar[list[str]] = []
    codecs: ClassVar[list[Type[BaseCodec]]] = []

    # Override these methods if necessary
    def decode(self):
        obj = {}
        if self.shorter and BoolCodec(self._buffer).decode():
            return obj

        for i in range(len(self.codecs)):
            attribute_name = self.attributes[i]
            codec_instance = self.codecs[i](self._buffer)
            decoded_value = codec_instance.decode()
            obj[attribute_name] = decoded_value
        return obj

    def encode(self, value):
        data_len = 0
        if self.shorter:
            if not value:
                BoolCodec(self._buffer).encode(True)
                return data_len
            else:
                BoolCodec(self._buffer).encode(False)
                data_len += 1

        for i in range(len(self.codecs)):
            data_len += self.codecs[i](self._buffer).encode(
                value[self.attributes[i]])
        return data_len
