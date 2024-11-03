from typing import ClassVar, Type

from modules.logger import Logger, logger
from utils.holders.protectionholder import ProtectionHolder
from utils.holders.socketholder import SocketHolder

from codec.base import BaseCodec
from utils.ebytearray import EByteArray


# Trust me, when you automate every function it ain't abstract anymore
class AbstractPacket:
    HEADER_LEN = 8

    id: ClassVar[int]
    description: ClassVar[str]
    codecs: ClassVar[list[Type[BaseCodec]]] = []
    attributes: ClassVar[list[str]] = []
    shouldLog: ClassVar[bool] = True

    protections: ProtectionHolder
    sockets: SocketHolder
    logger: Logger
    direction: bool

    objects: list
    object: dict = {}

    def __init__(
            self,
            direction: bool,
            protections: ProtectionHolder,
            sockets: SocketHolder):
        self.direction = direction
        self.protections = protections
        self.sockets = sockets
        self.logger = logger

        self.objects = []
        self.object = {}

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
        return data_len + AbstractPacket.HEADER_LEN, self.id, packet_data

    def implement(self) -> dict:
        self.object = {}
        for i in range(0, len(self.objects)):
            self.object[self.attributes[i]] = self.objects[i]
        return self.object

    def reimplement(self) -> list:
        self.objects = []
        for i in range(0, len(self.attributes)):
            self.objects.append(self.object[self.attributes[i]])
        return self.objects

    def process(self):
        # Default behavior is just to log the packet
        self.log()

    def log(self):
        logger.log_info(
            f"[{'IN' if self.direction else 'OUT'}] ({self.__class__.__name__}) | Data: {self.object}",
            self.shouldLog)
