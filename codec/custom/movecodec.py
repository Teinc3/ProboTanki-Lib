from ..custombasecodec import CustomBaseCodec
from ..complex import Vector3DCodec
from ..primitive import ByteCodec


class MoveCodec(CustomBaseCodec):
    attributes = ["angV", "control", "linV", "orientation", "pos"]
    codecs = [Vector3DCodec, ByteCodec, Vector3DCodec, Vector3DCodec, Vector3DCodec]
