from packets.abstractpacket import AbstractPacket

from codec.primitive import IntCodec

class Freeze_Start_OUT(AbstractPacket):
    id = -75406982
    description = "When we start using Freeze"
    attributes = ['time']
    codecs = [IntCodec]