from packets.abstractpacket import AbstractPacket

from codec.complex import DoubleIntCodec


class Battle_Ping_Info(AbstractPacket):
    id = 696140460
    description = "Information about the ping of the player."
    codecs = [DoubleIntCodec]
    attributes = ["latencyInfo"]