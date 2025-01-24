from lib.codec.complex import StringCodec
from lib.packets import AbstractPacket


class Reject_Invite(AbstractPacket):
    id = 1152865919
    description = "Reject a player's battle invite"
    attributes = ['username']
    codecs = [StringCodec]
