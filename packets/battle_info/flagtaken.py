from ...codec.primitive import IntCodec
from ...codec.complex import StringCodec
from .. import AbstractPacket


class Flag_Taken(AbstractPacket):
    id = -1282406496
    description = "Flag has been taken"
    codecs = [StringCodec, IntCodec]
    attributes = ['username', 'flagteam']


__all__ = ['Flag_Taken']