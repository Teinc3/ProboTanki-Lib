from lib.codec.complex import StringCodec, Vector3DCodec
from lib.codec.primitive import IntCodec, ByteCodec
from lib.packets.abstractpacket import AbstractPacket


class Player_Shot(AbstractPacket):
    id = -44282936
    description = "Player shot a shot."
    attributes = ['shooter', 'barrel', 'shotId', 'shotDirection']
    codecs = [StringCodec, ByteCodec, IntCodec, Vector3DCodec]
