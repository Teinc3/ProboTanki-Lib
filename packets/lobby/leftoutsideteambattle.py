from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Left_Outside_Team_Battle(AbstractPacket):
    id = 1447204641
    description = "Remove this player from the friends count in team status"
    attributes = ['battleID', 'username']
    codecs = [StringCodec, StringCodec]
    shouldLog = False
