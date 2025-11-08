from ...codec.complex import StringCodec
from ...codec.primitive import ByteCodec
from ...packets import AbstractPacket


class Rank_Status(AbstractPacket):
    id = -962759489
    description = "Loads the rank of a player"
    codecs = [ByteCodec, StringCodec]
    attributes = ['rank', 'username']
    shouldLog = False
