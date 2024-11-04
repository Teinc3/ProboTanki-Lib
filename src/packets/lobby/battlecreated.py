from codec.complex import StringCodec
from packets.abstractpacket import AbstractPacket


class Battle_Created(AbstractPacket):
    id = 802300608
    description = "Loads limited info about a newly created battle"
    codecs = [StringCodec]
    attributes = ['json']
