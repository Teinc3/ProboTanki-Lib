from ...codec.complex import StringCodec, Vector3DCodec
from ...codec.primitive import IntCodec, ByteCodec
from ...packets import AbstractPacket


class Player_Shot(AbstractPacket):
    id = -44282936
    description = "Player shot a shot."
    attributes = ['shooter', 'barrel', 'shotId', 'shotDirection']
    codecs = [StringCodec, ByteCodec, IntCodec, Vector3DCodec]
