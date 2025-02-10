from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Last_Battle_ID(AbstractPacket):
    id = -602527073
    description = "Get the id of the last battle you selected"
    attributes = ["battleId"]
    codecs = [StringCodec]
