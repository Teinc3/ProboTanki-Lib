from packets.abstractpacket import AbstractPacket

from codec.primitive import StringCodec, FloatCodec


class Tank_Health(AbstractPacket):
    id = -611961116
    description = "Updates the health of a tank"
    codecs = [StringCodec, FloatCodec]
    attributes = ['username', 'health']