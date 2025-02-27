from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Freeze_Start_OUT(AbstractPacket):
    id = -75406982
    description = "When we start using Freeze"
    attributes = ['clientTime']
    codecs = [IntCodec]
