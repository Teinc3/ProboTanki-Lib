from ...packets import AbstractPacket

from ...codec.complex import StringCodec


class Left_Inside_DM_Battle(AbstractPacket):
    id = -1689876764
    description = "A player has left a DM battle, the observer being within the battle"
    attributes = ["username"]
    codecs = [StringCodec]