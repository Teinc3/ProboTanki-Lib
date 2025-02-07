from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Not_In_Battle_Status(AbstractPacket):
    id = 1941694508
    description = "Sets the player's battle status to not in battle"
    attributes = ['username']
    codecs = [StringCodec]
    shouldLog = False
