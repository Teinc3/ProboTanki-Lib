from typing import Type, TypeVar, Generic

from ..basecodec import BaseCodec
from ..primitive import ByteCodec

T = TypeVar('T')
C = TypeVar('C', bound=BaseCodec)


class AbstractByteCountVectorCodec(BaseCodec[list[T]], Generic[T, C]):

    codec: Type[C]

    def decode(self) -> list[T]:
        count = ByteCodec(self._buffer).decode()
        if count < 0:
            count += 256
        return [self.codec(self._buffer).decode() for _ in range(count)]

    def encode(self, value: list[T]) -> int:
        count = len(value)
        if count > 255:
            raise ValueError(
                f"ByteCountVectorCodec can only encode up to 255 elements, got {count}"
            )
        bytes_written = ByteCodec(self._buffer).encode(count if count <= 127 else count - 256)
        for item in value:
            bytes_written += self.codec(self._buffer).encode(item)
        return bytes_written


def ByteCountVectorCodecFactory(element_type: Type[T], element_codec: Type[C]) -> Type[
    AbstractByteCountVectorCodec[T, C]]:
    class ByteCountVectorCodec(AbstractByteCountVectorCodec[element_type, element_codec]):
        codec = element_codec

    ByteCountVectorCodec.__name__ = f"ByteCountVectorCodec[{element_type.__name__}, {element_codec.__name__}]"
    return ByteCountVectorCodec
