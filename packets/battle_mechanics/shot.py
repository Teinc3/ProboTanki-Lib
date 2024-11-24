from lib.codec.complex import StringCodec
from lib.packets.abstractpacket import AbstractPacket


class Shot(AbstractPacket):
    id = 1719707347
    description = "Player shot"
    attributes = ['shot']
    codecs = [StringCodec]
