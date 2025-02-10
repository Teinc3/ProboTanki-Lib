from ...codec.complex import JsonCodec
from ...packets import AbstractPacket


class Player_Equipment(AbstractPacket):
    id = -1643824092
    description = "Player Equipment."
    attributes = ['json']
    codecs = [JsonCodec]
