from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Left_Outside_DM_Battle(AbstractPacket):
    id = 504016996
    description = "A player has left a DM battle, the observer being outside the battle"
    codecs = [StringCodec, StringCodec]
    attributes = ["battleID", "username"]
    shouldLog = False
