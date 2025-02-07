from ...codec.complex import StringCodec
from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Rank_Status(AbstractPacket):
    id = -962759489
    description = "Loads the rank of a player"
    codecs = [IntCodec, StringCodec]
    attributes = ['rank', 'username']
    shouldLog = False
