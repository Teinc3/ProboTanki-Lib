from packets.abstractpacket import AbstractPacket

from codec.primitive import StringCodec


class Load_Battle_Info(AbstractPacket):
    id = 546722394
    description = "Loads detailed battle information"
    codecs = [StringCodec]
    attributes = ['json']