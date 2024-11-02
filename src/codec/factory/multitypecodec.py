from typing import Type

from ..base import BaseCodec
from ..primitive import BoolCodec


def MultiTypeCodecFactory(attributes: list[str], element_codec: Type[BaseCodec], param_shortern=False):
    class MultiTypeCodec(BaseCodec[dict]):
        shortern = param_shortern
        
        def decode(self):
            obj = {}
            if self.shortern and BoolCodec(self._buffer).decode():
                return obj
            for attribute in attributes:
                obj[attribute] = element_codec(self._buffer).decode()
            return obj
        
        def encode(self, value):
            data_len = 0
            if self.shortern:
                data_len += BoolCodec(self._buffer).encode(not value)
                if not value:
                    return data_len
            for attribute in attributes:
                data_len += element_codec(self._buffer).encode(value[attribute])
            return data_len
        
    type_name = element_codec.__name__.replace("Codec", "").capitalize()
    MultiTypeCodec.__name__ = f"Multi{type_name}Codec[{len(attributes)}]"
    return MultiTypeCodec