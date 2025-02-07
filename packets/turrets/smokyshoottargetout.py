from ...packets import AbstractPacket

from ...codec.primitive import IntCodec, ShortCodec
from ...codec.complex import StringCodec, Vector3DCodec


class Smoky_Shoot_Target_OUT(AbstractPacket):
    id = 229267683
    description = "Our smoky shot hit a target"
    attributes = ["clientTime", "target", "incarnationID", "targetBodyPosition", "localHitPoint", "globalHitPoint"]
    codecs = [IntCodec, StringCodec, ShortCodec, Vector3DCodec, Vector3DCodec, Vector3DCodec]