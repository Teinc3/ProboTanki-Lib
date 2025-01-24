from lib.packets import AbstractPacket

from lib.codec.primitive import ByteCodec, IntCodec
from lib.codec.factory import VectorCodecFactory


class Wrong_New_Captcha(AbstractPacket):
    id = -373510957
    description = "The captcha was incorrect, a new one is sent"
    attributes = ["type", "imagedata"]
    codecs = [IntCodec, VectorCodecFactory(int, ByteCodec)]

    shouldLog = False