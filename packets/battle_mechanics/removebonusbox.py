from ...packets import AbstractPacket
from ...codec.complex import StringCodec


class Remove_Bonus_Box(AbstractPacket):
    id = -2026749922
    description = "Supply box bonus id"
    codecs = [StringCodec]
    attributes = ['bonusId']
