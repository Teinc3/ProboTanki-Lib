from lib.codec.complex import StringCodec
from lib.packets import AbstractPacket


class Battle_Id(AbstractPacket):
    id = -602527073
    description = "Get the battle id"
    attributes = ["battleId"]
    codecs = [StringCodec]
