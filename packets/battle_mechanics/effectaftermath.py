from lib.codec.complex import StringCodec
from lib.codec.primitive import IntCodec, BoolCodec, ByteCodec
from lib.packets import AbstractPacket


class Effect_Aftermath(AbstractPacket):
    id = -1639713644
    description = "Effect Aftermath"
    attributes = ['username', 'effectId', 'duration', 'activeAfterDeath', 'effectLevel']
    codecs = [StringCodec, IntCodec, IntCodec, BoolCodec, ByteCodec]
