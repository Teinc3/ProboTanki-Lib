from ..custombasecodec import CustomBaseCodec
from ..primitive import ByteCodec, FloatCodec


class TurretRotateCodec(CustomBaseCodec):
    attributes = ["angle", "control"]
    codecs = [FloatCodec, ByteCodec]
