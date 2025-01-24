from lib.codec.primitive import IntCodec
from lib.packets import AbstractPacket


class Battle_Time_Left(AbstractPacket):
    id = 732434644
    description = "Battle time left in seconds"
    codecs = [IntCodec]
    attributes = ['timeLimitInSec']
