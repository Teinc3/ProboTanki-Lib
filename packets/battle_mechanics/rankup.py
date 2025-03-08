from ...codec.complex import StringCodec
from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Rank_Up(AbstractPacket):
    id = 1262947513
    description = "Player Ranked Up"
    attributes = ['username', 'rank']
    codecs = [StringCodec, IntCodec]


__all__ = ['Rank_Up']