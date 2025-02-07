from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Pick_Up_Supplies(AbstractPacket):
    id = -1291499147
    description = "Pick Up Supplies"
    attributes = ['bonusId']
    codecs = [StringCodec]
