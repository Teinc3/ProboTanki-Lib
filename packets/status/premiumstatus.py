from lib.codec.complex import StringCodec
from lib.codec.primitive import IntCodec
from lib.packets import AbstractPacket


class Premium_Status(AbstractPacket):
    id = -2069508071
    description = "Updates a player's premium status"
    codecs = [IntCodec, StringCodec]
    attributes = ['timeLeft', 'username']
    shouldLog = False
