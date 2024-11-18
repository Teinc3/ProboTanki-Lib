from packets.abstractpacket import AbstractPacket

from codec.complex import StringCodec


class Accept_Invite(AbstractPacket):
    id = 814687528
    description = "Accepts a player's battle invite"
    attributes = ['username']
    codecs = [StringCodec]