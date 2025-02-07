from ...packets import AbstractPacket

from ...codec.primitive import IntCodec


class Captcha_Correct(AbstractPacket):
    id = -819536476
    description = "Captcha is correct"
    attributes = ["type"]
    codecs = [IntCodec]