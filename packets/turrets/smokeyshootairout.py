from ...packets import AbstractPacket
from ...codec.primitive import IntCodec


class Smoky_Shoot_Air_OUT(AbstractPacket):
    id = 1478921140
    description = "Smokey Shoot at Air"
    attributes = ["clientTime"]
    codecs = [IntCodec]
