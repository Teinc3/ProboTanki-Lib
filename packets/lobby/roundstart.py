from lib.codec.complex import StringCodec
from lib.packets import AbstractPacket


class Round_Start(AbstractPacket):
    id = -344514517
    description = "Starts a new round in the existing battle"
    attributes = ['battleID']
    codecs = [StringCodec]
