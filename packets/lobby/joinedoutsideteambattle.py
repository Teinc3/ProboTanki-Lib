from ...codec.complex import StringCodec
from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Joined_Outside_Team_Battle(AbstractPacket):
    id = -169305322
    description = "Sent when a player joins a global Team battle, outside from the observer's perspective."
    attributes = ['battleID', 'username', 'team']
    codecs = [StringCodec, StringCodec, IntCodec]
    shouldLog = False
