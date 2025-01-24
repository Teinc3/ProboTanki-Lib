from lib.codec.complex import StringCodec
from lib.codec.primitive import IntCodec
from lib.packets.abstractpacket import AbstractPacket


class Kill_Confirm(AbstractPacket):
    id = -42520728
    description = "A tank has been killed"
    codecs = [StringCodec, StringCodec, IntCodec]
    attributes = ['target', 'killer', 'respDelay']
