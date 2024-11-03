from codec.complex import StringCodec
from packets.abstractpacket import AbstractPacket


class Load_Battle_Info(AbstractPacket):
    id = 546722394
    description = "Loads detailed battle information"
    codecs = [StringCodec]
    attributes = ['json']
