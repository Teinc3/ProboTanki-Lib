from lib.packets import AbstractPacket

from lib.codec.primitive import IntCodec
from lib.codec.complex import StringCodec


class Answer_Captcha(AbstractPacket):
    id = 1271163230
    description = 'Answer the captcha'
    codecs = [IntCodec, StringCodec]
    attributes = ["type", "imagedata"]
