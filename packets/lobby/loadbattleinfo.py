from lib.codec.complex import JsonCodec
from lib.packets.abstractpacket import AbstractPacket


class Load_Battle_Info(AbstractPacket):
    id = 546722394
    description = "Loads detailed battle information"
    codecs = [JsonCodec]
    attributes = ['json']