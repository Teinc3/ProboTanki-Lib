from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec
from ..primitive import FloatCodec, IntCodec


class TankDamageCodec(CustomBaseCodec):
    attributes = ["damage", "damageType", "target"]
    codecs = [FloatCodec, IntCodec, StringCodec]
