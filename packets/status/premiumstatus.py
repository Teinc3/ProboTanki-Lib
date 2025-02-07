from ...codec.complex import StringCodec
from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Premium_Status(AbstractPacket):
    id = -2069508071
    description = "Updates a player's premium status"
    codecs = [IntCodec, StringCodec]
    attributes = ['timeLeft', 'username']
    shouldLog = False
