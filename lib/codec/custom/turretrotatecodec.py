from lib.codec.base import CustomBaseCodec
from lib.codec.primitive import ByteCodec, FloatCodec


class TurretRotateCodec(CustomBaseCodec):
    attributes = ["angle", "control"]
    codecs = [FloatCodec, ByteCodec]
