from ...packets import AbstractPacket

from ...codec.primitive import IntCodec


class Fire_End_OUT(AbstractPacket):
    id = -1300958299
    description = "Firebird stops shooting"
    attributes = ['clientTime']
    codecs = [IntCodec]