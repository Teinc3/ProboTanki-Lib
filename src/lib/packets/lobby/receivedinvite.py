from lib.codec.complex import StringCodec
from lib.packets.abstractpacket import AbstractPacket


class Received_Invite(AbstractPacket):
    id = 810713262
    description = "Accepts a player's battle invite"
    attributes = ['username']
    codecs = [StringCodec]
