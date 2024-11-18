from codec.base import CustomBaseCodec
from codec.complex import Vector3DCodec
from codec.primitive import ByteCodec


class MoveCodec(CustomBaseCodec):
    attributes = ["angV", "control", "linV", "orientation", "pos"]
    codecs = [Vector3DCodec, ByteCodec, Vector3DCodec, Vector3DCodec, Vector3DCodec]
