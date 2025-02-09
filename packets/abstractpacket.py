from typing import ClassVar, Type

from ..codec import BaseCodec
from ..modules.security import Protection
from ..utils import EByteArray


class AbstractPacket():
    """
    Abstract class for packets. This class is used to define the structure of packets that are sent and received by the server.
    
    WARNING: This class is not an abstract class.
    You can still create instances of this class, such as when no children class exists, but it is not recommended.
    """

    HEADER_LEN = 8

    id: ClassVar[int]
    description: ClassVar[str]
    codecs: ClassVar[list[Type[BaseCodec]]] = []
    attributes: ClassVar[list[str]] = []
    shouldLog: ClassVar[bool] = True

    objects: list
    object: dict = {}

    def __init__(self):
        self.objects = []
        self.object = {}

    def unwrap(self, packet_data: EByteArray) -> dict:
        """Decodes the binary data into individual objects"""

        for i in range(0, len(self.codecs)):
            codec: BaseCodec = self.codecs[i](packet_data)
            self.objects.append(codec.decode())
        return self.implement()

    def wrap(self, protection: Protection = None) -> EByteArray:
        """Encodes all the objects into binary data for the packet payload"""

        packet_data = EByteArray()
        data_len = AbstractPacket.HEADER_LEN

        if self.__class__.__name__ == 'AbstractPacket' and len(self.objects) == 1:
            # Unknown packet got its data fitted into an abstractpacket, so we just write back the data
            packet_data = self.objects[0]
            data_len += len(packet_data)
        else:
            # Encode the objects according to the codecs
            for i in range(0, len(self.codecs)):
                codec = self.codecs[i](packet_data)
                data_len += codec.encode(self.objects[i])

        encrypted_data = protection.encrypt(packet_data)
        packet_data = EByteArray().write_int(data_len).write_int(self.id).write(encrypted_data)
        return packet_data

    def implement(self) -> dict:
        """Implements the packet object based on the attribute key list and the decoded object list"""

        self.object = {}
        for i in range(0, len(self.objects)):
            self.object[self.attributes[i]] = self.objects[i]
        return self.object

    def deimplement(self, object: dict = None) -> list:
        """Breaks down the packet object into a list of encodable objects based on the attribute key list"""

        self.objects = []
        for i in range(0, len(self.attributes)):
            self.objects.append((object if object else self.object)[self.attributes[i]])
        return self.objects

    def process(self) -> bool:
        """Process the packet, then indicates if the packet should no longer be forwarded to the server"""

        return False # Default behavior is just to log the packet and declare no packet interception

    # def log(self):
    #    logger.log_info(f"<{'IN' if self.direction else 'OUT'}> ({self.__class__.__name__}){'' if self.shouldLog else ' - NoDisp'} | Data: {self.object}")