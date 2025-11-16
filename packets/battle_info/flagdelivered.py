from ...codec.primitive import IntCodec
from ...codec.complex import StringCodec
from .. import AbstractPacket


class Flag_Delivered(AbstractPacket):
    id = -1870108387
    description = "Flag has been delivered"
    codecs = [IntCodec, StringCodec]
    attributes = ['baseteam', 'username']


__all__ = ['Flag_Delivered']