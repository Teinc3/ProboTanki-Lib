from lib.packets import AbstractPacket

from lib.codec.primitive import IntCodec


class Request_Captcha(AbstractPacket):
    id = -349828108
    description = "Request a captcha"
    attributes = ["type"]
    codecs = [IntCodec]