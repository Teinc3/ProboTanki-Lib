from packets.abstractpacket import AbstractPacket

from codec.complex import StringCodec


class Reject_Invite(AbstractPacket):
    id = 1152865919
    description = "Reject a player's battle invite"
    attributes = ['username']
    codecs = [StringCodec]