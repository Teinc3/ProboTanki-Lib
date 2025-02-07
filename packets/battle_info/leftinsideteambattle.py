from ...packets import AbstractPacket

from ...codec.complex import StringCodec


class Left_Inside_Team_Battle(AbstractPacket):
    id = 1411656080
    description = "A player has left a team battle, the observer being within the battle"
    attributes = ["username"]
    codecs = [StringCodec]