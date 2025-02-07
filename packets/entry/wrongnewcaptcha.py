from ...packets import AbstractPacket

from ...codec.primitive import ByteCodec, IntCodec
from ...codec.factory import VectorCodecFactory


class Wrong_New_Captcha(AbstractPacket):
    id = -373510957
    description = "The captcha was incorrect, a new one is sent"
    attributes = ["type", "imagedata"]
    codecs = [IntCodec, VectorCodecFactory(int, ByteCodec)]

    shouldLog = False