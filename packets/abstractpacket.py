from typing import ClassVar, Type

from lib.codec.base import BaseCodec
from lib.modules.logger import Logger, logger
from lib.modules.protection import Protection

from lib.utils.holders.protectionholder import ProtectionHolder
from lib.utils.holders.socketholder import SocketHolder
from lib.utils.ebytearray import EByteArray


# Trust me, when you automate every function it ain't abstract anymore
class AbstractPacket():
    HEADER_LEN = 8

    id: ClassVar[int]
    description: ClassVar[str]
    codecs: ClassVar[list[Type[BaseCodec]]] = []
    attributes: ClassVar[list[str]] = []
    shouldLog: ClassVar[bool] = True


    proxy: bool
    direction: bool | None
    protections: ProtectionHolder | None
    sockets: SocketHolder | None
    logger: Logger | None

    objects: list
    object: dict = {}

    def __init__(self, proxy: bool = False, direction: bool = None, protections: ProtectionHolder = None, sockets: SocketHolder = None):
        self.proxy = proxy

        if proxy:
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

    def wrap(self, protection: Protection = None) -> EByteArray:
        packet_data = EByteArray()
        data_len = AbstractPacket.HEADER_LEN
        for i in range(0, len(self.codecs)):
            codec = self.codecs[i](packet_data)
            data_len += codec.encode(self.objects[i])

        encrypted_data = (self.protections.c2s if self.proxy else protection).encrypt(packet_data)
        packet_data = EByteArray().write_int(data_len).write_int(self.id).write(encrypted_data)
        return packet_data

    def implement(self) -> dict:
        self.object = {}
        for i in range(0, len(self.objects)):
            self.object[self.attributes[i]] = self.objects[i]
        return self.object

    def deimplement(self, object: dict = None) -> list:
        self.objects = []
        for i in range(0, len(self.attributes)):
            self.objects.append((object if object else self.object)[self.attributes[i]])
        return self.objects

    def process(self) -> bool:
        """Process the packet, then indicates if the packet should no longer be forwarded to the server"""
        # Default behavior is just to log the packet and declare no packet interception
        if self.proxy:
            self.log()
        return False

    def log(self):
        logger.log_info(f"<{'IN' if self.direction else 'OUT'}> ({self.__class__.__name__}){'' if self.shouldLog else ' - NoDisp'} | Data: {self.object}")

    # Example of packet manipulation:

    # Override process() in child class for manipulation
    # def process(self):
    #     # Change properties in existing "Implemented" object
    #     self.object['username'] = "New Username"

    #     # Convert back to "Deimplemented" object list for encoding
    #     self.deimplement()
    #     packet_len, _, unencrypted_data = self.wrap()

    #     # Create a new buffer and pack data into it
    #     packet_data = EByteArray()
    #     packet_data.write_int(packet_len)
    #     packet_data.write_int(self.id)
    #     packet_data.write(self.protections.c2s.encrypt(unencrypted_data))

    #     # Use the server socket to send the packet
    #     self.sockets.server.send(packet_data)

    #     # Allow the superclass to log the modification
    #     super().process()

    #     # Return True if you want to avoid forwarding OG packet to server, False otherwise
    #     return True
