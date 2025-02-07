from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Joined_Outside_DM_Battle(AbstractPacket):
    id = -2133657895
    description = "Sent when a player joins a global DM battle, outside from the observer's perspective."
    attributes = ['battleID', 'username']
    codecs = [StringCodec, StringCodec]
    shouldLog = False
