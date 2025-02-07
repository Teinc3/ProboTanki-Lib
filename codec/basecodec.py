from abc import ABC, abstractmethod
from typing import TypeVar, Generic, Any

from ..utils import EByteArray

T = TypeVar("T", bound=Any)


class BaseCodec(ABC, Generic[T]):
    """
    Base "Interface" for all codecs, whether primitive or complex

    Type: Generic[T] (T is bound to Any, but can be specified for less complex codecs)

    Static Methods:
    - decode: Decodes a value from an ebytearray
    - encode: Encodes a value to an ebytearray
    """

    boolshortern = False

    def __init__(self, buffer: EByteArray):
        self._buffer = buffer

    @abstractmethod
    def decode(self) -> T:
        raise NotImplementedError()

    @abstractmethod
    def encode(self, value: T) -> int:
        """
        Encodes a value to an ebytearray and returns the number of bytes written
        """
        raise NotImplementedError()
