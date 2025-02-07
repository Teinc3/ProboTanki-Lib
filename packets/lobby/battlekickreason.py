from ...packets import AbstractPacket

from ...codec.complex import StringCodec


class Battle_Kick_Reason(AbstractPacket):
    id = -322235316
    description = "Reason why player was kicked from battle"
    attributes = ["reason"]
    codecs = [StringCodec]