from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Accept_Invite(AbstractPacket):
    id = 814687528
    description = "Accepts a player's battle invite"
    attributes = ['username']
    codecs = [StringCodec]
