from ..custombasecodec import CustomBaseCodec
from ..complex import Vector3DCodec, StringCodec
from ..primitive import FloatCodec


class TargetPositionCodec(CustomBaseCodec):
    attributes = ['localHitPoint', 'orientation', 'position', 'target', 'turretAngle']
    codecs = [Vector3DCodec, Vector3DCodec, Vector3DCodec, StringCodec, FloatCodec]