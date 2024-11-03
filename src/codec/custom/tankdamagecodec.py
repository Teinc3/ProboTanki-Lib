from codec.base import CustomBaseCodec
from codec.primitive import FloatCodec, IntCodec
from codec.complex import StringCodec


class TankDamageCodec(CustomBaseCodec):
    attributes = ["damage", "damageType", "target"]
    codecs = [FloatCodec, IntCodec, StringCodec]
