from ...codec.complex import StringCodec
from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Shot_Effect(AbstractPacket):
    id = -1994318624
    description = "Shot effect packet"
    attributes = ['username', 'effectId']
    codecs = [StringCodec, IntCodec]
