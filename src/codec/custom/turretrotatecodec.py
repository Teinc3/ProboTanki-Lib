from codec.base import CustomBaseCodec
from codec.primitive import ByteCodec, FloatCodec


class TurretRotateCodec(CustomBaseCodec):
    attributes = ["angle", "control"]
    codecs = [FloatCodec, ByteCodec]
