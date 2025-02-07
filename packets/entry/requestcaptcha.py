from ...packets import AbstractPacket

from ...codec.primitive import IntCodec


class Request_Captcha(AbstractPacket):
    id = -349828108
    description = "Request a captcha"
    attributes = ["type"]
    codecs = [IntCodec]