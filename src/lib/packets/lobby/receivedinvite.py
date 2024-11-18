from packets.abstractpacket import AbstractPacket

from codec.complex import StringCodec


class Received_Invite(AbstractPacket):
    id = 810713262
    description = "Accepts a player's battle invite"
    attributes = ['username']
    codecs = [StringCodec]