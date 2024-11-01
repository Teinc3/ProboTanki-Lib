from packets.abstractpacket import AbstractPacket
from codec.primitive import ByteCodec
from codec.complex import VectorCodecFactory


class Activate_Protection(AbstractPacket):
    id = 2001736388
    description = 'Contains the keys required to activate packet encryption'
    codecs = [VectorCodecFactory(int, ByteCodec)]
    attributes = ['keys']