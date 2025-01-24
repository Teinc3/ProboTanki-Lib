from lib.codec.complex import StringCodec
from lib.packets.abstractpacket import AbstractPacket


class Load_Supply_Effect(AbstractPacket):
    id = 417965410
    description = "Load Current Supply Effect"
    attributes = ['json']
    codecs = [StringCodec]
