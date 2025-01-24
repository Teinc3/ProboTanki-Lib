from lib.codec.primitive import IntCodec
from lib.packets import AbstractPacket


class Battle_Fund(AbstractPacket):
    id = 1149211509
    description = "Battle fund"
    codecs = [IntCodec]
    attributes = ['fund']
