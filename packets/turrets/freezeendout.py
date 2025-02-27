from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Freeze_End_OUT(AbstractPacket):
    id = -1654947652
    description = "When we stop using Freeze"
    attributes = ['clientTime']
    codecs = [IntCodec]
