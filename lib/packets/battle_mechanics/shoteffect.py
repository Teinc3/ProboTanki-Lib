from lib.codec.complex import StringCodec
from lib.codec.primitive import IntCodec
from lib.packets.abstractpacket import AbstractPacket


class Shot_Effect(AbstractPacket):
    id = -1994318624
    description = "Shot effect packet"
    attributes = ['username', 'effectId']
    codecs = [StringCodec, IntCodec]
