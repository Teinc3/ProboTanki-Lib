from ...codec.complex import Vector3DCodec
from ...packets import AbstractPacket
from ...codec.primitive import IntCodec


class Smoky_Shoot_Wall_OUT(AbstractPacket):
    id = 1470597926
    description = "Smokey Shoot out"
    attributes = ["clientTime", "hitPoint"]
    codecs = [IntCodec, Vector3DCodec]
