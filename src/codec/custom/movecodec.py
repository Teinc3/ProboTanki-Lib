from codec.base import CustomBaseCodec
from codec.primitive import ByteCodec
from codec.complex import Vector3DCodec


class MoveCodec(CustomBaseCodec):
    attributes = ["angV", "control", "linV", "orientation", "pos"]
    codecs = [Vector3DCodec, ByteCodec, Vector3DCodec, Vector3DCodec, Vector3DCodec]
