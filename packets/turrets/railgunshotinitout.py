from ...packets import AbstractPacket

from ...codec.primitive import IntCodec


class Railgun_Shot_Init_OUT(AbstractPacket):
    id = -1759063234
    description = "Sends server details about a railgun shot that has just started to release"
    attributes = ["clientTime"]
    codecs = [IntCodec]