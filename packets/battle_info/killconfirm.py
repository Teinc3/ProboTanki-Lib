from ...codec.complex import StringCodec
from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Kill_Confirm(AbstractPacket):
    id = -42520728
    description = "A tank has been killed"
    codecs = [StringCodec, StringCodec, IntCodec]
    attributes = ['target', 'killer', 'respDelay']
