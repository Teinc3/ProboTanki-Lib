from packets import AbstractPacket

from codec.complex import StringCodec


class Left_Team_Battle(AbstractPacket):
    id = 1411656080
    description = "Player left the team battle"
    attributes = "username"
    codecs = [StringCodec]