from packets.abstractpacket import AbstractPacket

from codec.primitive import StringCodec, IntCodec


class Kill_Confirm(AbstractPacket):
    id = -42520728
    description = "A tank has been killed"
    codecs = [StringCodec, StringCodec, IntCodec]
    attributes = ['target', 'killer', 'respDelay']