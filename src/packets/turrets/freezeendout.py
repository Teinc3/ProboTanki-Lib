from packets.abstractpacket import AbstractPacket

from codec.primitive import IntCodec

class Freeze_End_OUT(AbstractPacket):
    id = -1654947652
    description = "When we stop using Freeze"
    attributes = ['time']
    codecs = [IntCodec]