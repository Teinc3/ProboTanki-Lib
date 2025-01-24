from lib.codec.complex import StringCodec
from lib.packets.abstractpacket import AbstractPacket


class Player_Equipment(AbstractPacket):
    id = -1643824092
    description = "Player Equipment."
    attributes = ['json']
    codecs = [StringCodec]
