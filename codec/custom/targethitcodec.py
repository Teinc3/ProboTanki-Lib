from ..custombasecodec import CustomBaseCodec
from ..complex import Vector3DCodec, StringCodec
from ..primitive import ByteCodec


class TargetHitCodec(CustomBaseCodec):
    attributes = ['direction', 'localHitPoint', 'numberOfHits', 'target']
    codecs = [Vector3DCodec, Vector3DCodec, ByteCodec, StringCodec]


__all__ = ['TargetHitCodec']