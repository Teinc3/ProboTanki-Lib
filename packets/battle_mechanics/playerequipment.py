from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Player_Equipment(AbstractPacket):
    id = -1643824092
    description = "Player Equipment."
    attributes = ['json']
    codecs = [StringCodec]
