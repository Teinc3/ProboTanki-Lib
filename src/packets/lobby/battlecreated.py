from packets.abstractpacket import AbstractPacket

from codec.complex import StringCodec


class Battle_Created(AbstractPacket):
    id = 802300608
    description = "Loads limited info about a newly created battle"
    codecs = [StringCodec]
    attributes = ['json']