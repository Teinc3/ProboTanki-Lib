from lib.codec.complex import StringCodec
from lib.codec.primitive import FloatCodec
from lib.packets.abstractpacket import AbstractPacket


class Tank_Health(AbstractPacket):
    id = -611961116
    description = "Updates the health of a tank"
    codecs = [StringCodec, FloatCodec]
    attributes = ['username', 'health']
