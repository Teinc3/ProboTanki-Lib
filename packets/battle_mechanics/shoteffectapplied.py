from lib.codec.complex import StringCodec, Vector3DCodec
from lib.packets import AbstractPacket


class Shot_Effect_Applied(AbstractPacket):
    id = 546849203
    description = "Shot Effect Applied"
    attributes = ['shooter', 'hitPoint']
    codecs = [StringCodec, Vector3DCodec]
