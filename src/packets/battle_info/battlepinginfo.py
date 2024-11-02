from packets.abstractpacket import AbstractPacket

from codec.complex import DoubleIntCodecFactory


class Battle_Ping_Info(AbstractPacket):
    id = 34068208
    description = "Information about the ping of the player."
    codecs = [DoubleIntCodecFactory("serverSessionTime", "clientPing")]
    attributes = ["latencyInfo"]