from ...codec.complex import StringCodec
from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Player_Rank_Up(AbstractPacket):
    id = 1262947513
    description = "Player Rank Up"
    attributes = ['userId', 'newRank']
    codecs = [StringCodec, IntCodec]
