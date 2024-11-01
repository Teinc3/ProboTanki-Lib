from typing import Type, TypeVar, Generic

from codec.base import BaseCodec
from codec.primitive.intcodec import IntCodec

T = TypeVar('T')
C = TypeVar('C', bound=BaseCodec)


class AbstractVectorCodec(BaseCodec[list[T]], Generic[T, C]):
    codec: Type[C]

    def decode(self) -> list[T]:
        list_len = IntCodec(self._buffer).decode()
        return [self.codec(self._buffer).decode() for _ in range(list_len)]

    def encode(self, value: list[T]) -> int:
        bytes_written = IntCodec(self._buffer).encode(len(value))
        for item in value:
            bytes_written += self.codec(self._buffer).encode(item)
        return bytes_written
    
def VectorCodecFactory(element_type: Type[T], element_codec: Type[C]) -> Type[AbstractVectorCodec[T, C]]:
    class VectorCodec(AbstractVectorCodec[T, C]):
        codec = element_codec
    VectorCodec.__name__ = f"VectorCodec[{element_type.__name__}, {element_codec.__name__}]"
    return VectorCodec