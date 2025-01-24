from lib.codec.primitive import IntCodec
from lib.packets import AbstractPacket


class Freeze_End_OUT(AbstractPacket):
    id = -1654947652
    description = "When we stop using Freeze"
    attributes = ['time']
    codecs = [IntCodec]
