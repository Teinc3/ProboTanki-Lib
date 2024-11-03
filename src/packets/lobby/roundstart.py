from packets.abstractpacket import AbstractPacket

from codec.complex import StringCodec


class Round_Start(AbstractPacket):
    id = -344514517
    description = "Starts a new round in the existing battle"
    attributes = ['battleID']
    codecs = [StringCodec]