from ...codec.complex import StringCodec
from ...codec.primitive import IntCodec, BoolCodec
from ...packets import AbstractPacket


class Online_Status(AbstractPacket):
    id = 2041598093
    description = "Updates Player's Online Status"
    codecs = [BoolCodec, IntCodec, StringCodec]
    attributes = ['online', 'serverID', 'username']
    shouldLog = False
