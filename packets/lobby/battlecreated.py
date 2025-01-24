from lib.codec.complex import JsonCodec
from lib.packets.abstractpacket import AbstractPacket


class Battle_Created(AbstractPacket):
    id = 802300608
    description = "Loads limited info about a newly created battle"
    codecs = [JsonCodec]
    attributes = ['json']
