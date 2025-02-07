from ...codec.complex import StringCodec, Vector3DCodec
from ...packets import AbstractPacket
from ...codec.primitive import FloatCodec, BoolCodec


class Smoky_Shot_IN(AbstractPacket):
    id = -1334002026
    description = "Smokey Shoot in"
    attributes = ["shooter", "target", "hitPoint", "weakeningCoeff", "isCritical"]
    codecs = [StringCodec, StringCodec, Vector3DCodec, FloatCodec, BoolCodec]
