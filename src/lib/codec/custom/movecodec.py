from lib.codec.base import CustomBaseCodec
from lib.codec.complex import Vector3DCodec
from lib.codec.primitive import ByteCodec


class MoveCodec(CustomBaseCodec):
    attributes = ["angV", "control", "linV", "orientation", "pos"]
    codecs = [Vector3DCodec, ByteCodec, Vector3DCodec, Vector3DCodec, Vector3DCodec]
