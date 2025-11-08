from typing import ClassVar, Type

from ..codec import BaseCodec
from ..modules.security import CProtection
from ..utils import EByteArray


class AbstractPacket:
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

    def __init__(self):
        self.objects: list = []
        self.object: dict = {}
        
    def unwrap(self, packet_data: EByteArray) -> dict:
        """Decodes the binary data into individual objects"""

        for i in range(0, len(self.codecs)):
            codec: BaseCodec = self.codecs[i](packet_data)
            self.objects.append(codec.decode())
        return self.implement()

    def wrap(self, protection: CProtection = None, s2c_proxy: bool = False) -> EByteArray:
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

        encrypted_data = protection.encrypt(bytearray(packet_data))
        packet_data = EByteArray().write_int(data_len).write_int(self.id)
        # If proxy forwarding into a client (S2C), override the header with no compression
        # Otherwise (C2S proxy, or no proxy), use current method (4-byte length)
        if s2c_proxy:
            # 1 byte 00 + 3 byte packet length + 4 byte packet ID
            # First byte wipe to 0 (Our packet length shouldn't be that long to take up this many bits anyways)
            packet_data[0] = 0x00
        packet_data = packet_data.write(EByteArray(encrypted_data))
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

    def log_repr(self, direction: bool) -> str:
        """Return a string representation of the packet for logging purposes"""
        if self.__class__.__name__ == __class__.__name__:
            packet_name = f"Unknown Packet - ID: {self.id})"
        else:
            packet_name = self.__class__.__name__
        return f"<{'IN' if direction else 'OUT'}> ({packet_name}){'' if self.shouldLog else ' - NoDisp'} | Data: {self.object}"