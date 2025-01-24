from lib.packets import AbstractPacket

from lib.codec.primitive import IntCodec


class Captcha_Correct(AbstractPacket):
    id = -819536476
    description = "Captcha is correct"
    attributes = ["type"]
    codecs = [IntCodec]