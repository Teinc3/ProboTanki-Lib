from typing import Type, TypeVar, Generic

from codec.base import BaseCodec
from codec.primitive import IntCodec, BoolCodec

T = TypeVar('T')
C = TypeVar('C', bound=BaseCodec)


class AbstractVectorCodec(BaseCodec[list[T]], Generic[T, C]):
    codec: Type[C]

    def decode(self) -> list[T]:
        if self.shortern and BoolCodec(self._buffer).decode():
            return []
        
        list_len = IntCodec(self._buffer).decode()
        return [self.codec(self._buffer).decode() for _ in range(list_len)]

    def encode(self, value: list[T]) -> int:
        bytes_written = 0
        if self.shortern:
            if len(value) == 0:
                BoolCodec(self._buffer).encode(True)
                return 1
            BoolCodec(self._buffer).encode(False)
            bytes_written += 1

        bytes_written += IntCodec(self._buffer).encode(len(value))
        for item in value:
            bytes_written += self.codec(self._buffer).encode(item)
        return bytes_written
    
def VectorCodecFactory(element_type: Type[T], element_codec: Type[C], param_shortern=False) -> Type[AbstractVectorCodec[T, C]]:
    class VectorCodec(AbstractVectorCodec[T, C]):
        codec = element_codec
        shortern = param_shortern
    VectorCodec.__name__ = f"VectorCodec[{element_type.__name__}, {element_codec.__name__}]"
    return VectorCodec