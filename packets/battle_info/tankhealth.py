from ...codec.complex import StringCodec
from ...codec.primitive import FloatCodec
from ...packets import AbstractPacket


class Tank_Health(AbstractPacket):
    id = -611961116
    description = "Updates the health of a tank"
    codecs = [StringCodec, FloatCodec]
    attributes = ['username', 'health']
