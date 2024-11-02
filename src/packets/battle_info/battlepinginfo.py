from packets.abstractpacket import AbstractPacket

from codec.complex import DoubleIntCodec


class Battle_Ping_Info(AbstractPacket):
    id = 34068208
    description = "Information about the ping of the player."
    codecs = [DoubleIntCodec]
    attributes = ["latencyInfo"]