from lib.codec.complex import StringCodec
from lib.codec.primitive import ShortCodec
from lib.packets import AbstractPacket


class Shot_Direction(AbstractPacket):
    id = -118119523
    description = "Shot direction"
    attributes = ['shooter', 'shotDirectionX', 'shotDirectionY', 'shotDirectionZ']
    codecs = [StringCodec, ShortCodec, ShortCodec, ShortCodec]
