from lib.codec.complex import StringCodec, Vector3DCodec
from lib.packets.abstractpacket import AbstractPacket
from lib.codec.primitive import FloatCodec, BoolCodec


class Smokey_Shot_IN(AbstractPacket):
    id = -1334002026
    description = "Smokey Shoot in"
    attributes = ["shooter", "target", "hitPoint", "weakeningCoeff", "isCritical"]
    codecs = [StringCodec, StringCodec, Vector3DCodec, FloatCodec, BoolCodec]
