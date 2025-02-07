from ...codec.complex import StringCodec
from ...codec.primitive import ShortCodec
from ...packets import AbstractPacket


class Shot_Direction(AbstractPacket):
    id = -118119523
    description = "Shot direction"
    attributes = ['shooter', 'shotDirectionX', 'shotDirectionY', 'shotDirectionZ']
    codecs = [StringCodec, ShortCodec, ShortCodec, ShortCodec]
