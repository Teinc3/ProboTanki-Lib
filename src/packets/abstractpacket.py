from typing import ClassVar, Type

from codec.base import BaseCodec
from utils.ebytearray import EByteArray

# Trust me, when you automate every function it ain't abstract anymore
class AbstractPacket:
    HEADER_LEN = 8

    id: ClassVar[int]
    description: ClassVar[str]
    codecs: ClassVar[list[Type[BaseCodec]]] = []
    attributes: ClassVar[list[str]] = []
    log: ClassVar[bool] = True

    objects: list

    # @staticmethod
    # @property
    # def name(cls) -> str:
    #     return " ".join(cls.__class__.__name__.split('_'))

    def unwrap(self, packet_data: EByteArray) -> dict:
        for i in range(0, len(self.codecs)):
            codec: BaseCodec = self.codecs[i](packet_data)
            self.objects.append(codec.decode())
        return self.implement()
        

    def wrap(self) -> tuple[int, int, EByteArray]:
        packet_data = EByteArray()
        data_len = 0
        for i in range(0, len(self.codecs)):
            codec: BaseCodec = self.codecs[i](packet_data)
            data_len += codec.encode(self.objects[i])
        return (data_len + AbstractPacket.HEADER_LEN, self.id, packet_data)
    
    def implement(self) -> dict:
        obj = {}
        for i in range(0, len(self.objects)):
            obj[self.attributes[i]] = self.objects[i]
        return obj