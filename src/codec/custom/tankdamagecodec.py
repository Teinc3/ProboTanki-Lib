from codec.base import CustomBaseCodec
from codec.complex import StringCodec
from codec.primitive import FloatCodec, IntCodec


class TankDamageCodec(CustomBaseCodec):
    attributes = ["damage", "damageType", "target"]
    codecs = [FloatCodec, IntCodec, StringCodec]
