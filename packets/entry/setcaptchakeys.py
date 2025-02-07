from ...packets import AbstractPacket

from ...codec.primitive import IntCodec
from ...codec.factory import VectorCodecFactory


class Set_Captcha_Keys(AbstractPacket):
    id = 321971701
    description = "Sets captcha hash keys"
    codecs = [VectorCodecFactory(int, IntCodec)]
    attributes = ['keys']
