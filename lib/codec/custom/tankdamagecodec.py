from lib.codec.base import CustomBaseCodec
from lib.codec.complex import StringCodec
from lib.codec.primitive import FloatCodec, IntCodec


class TankDamageCodec(CustomBaseCodec):
    attributes = ["damage", "damageType", "target"]
    codecs = [FloatCodec, IntCodec, StringCodec]
