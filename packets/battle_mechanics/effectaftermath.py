from ...codec.complex import StringCodec
from ...codec.primitive import IntCodec, BoolCodec, ByteCodec
from ...packets import AbstractPacket


class Effect_Aftermath(AbstractPacket):
    id = -1639713644
    description = "Effect Aftermath"
    attributes = ['username', 'effectId', 'duration', 'activeAfterDeath', 'effectLevel']
    codecs = [StringCodec, IntCodec, IntCodec, BoolCodec, ByteCodec]
