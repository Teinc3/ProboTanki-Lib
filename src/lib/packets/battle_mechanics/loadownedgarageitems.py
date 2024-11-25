from lib.codec.complex import StringCodec
from lib.packets.abstractpacket import AbstractPacket


class Load_Owned_Garage_Items(AbstractPacket):
    id = -255516505
    description = "Load Owned Garage Items"
    attributes = ['json']
    codecs = [StringCodec]
