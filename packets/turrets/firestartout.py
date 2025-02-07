from ...packets import AbstractPacket

from ...codec.primitive import IntCodec


class Fire_Start_OUT(AbstractPacket):
    id = -1986638927
    description = "Firebird starts shooting"
    attributes = ['clientTime']
    codecs = [IntCodec]