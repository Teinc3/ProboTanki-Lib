from ...packets import AbstractPacket

from ...codec.primitive import ByteCodec, IntCodec
from ...codec.factory import VectorCodecFactory


class Receive_Captcha(AbstractPacket):
    id = -1670408519
    description = "Received a captcha image with its type"
    attributes = ["type", "imagedata"]
    codecs = [IntCodec, VectorCodecFactory(int, ByteCodec)]

    shouldLog = False