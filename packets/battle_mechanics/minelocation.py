from ...codec.complex import StringCodec
from ...codec.primitive import FloatCodec
from ...packets import AbstractPacket


class Mine_Location(AbstractPacket):
    id = 272183855
    description = "Sent when a mine is placed or removed."
    attributes = ['mineId', 'x', 'y', 'z', 'userId']
    codecs = [StringCodec, FloatCodec, FloatCodec, FloatCodec, StringCodec]
