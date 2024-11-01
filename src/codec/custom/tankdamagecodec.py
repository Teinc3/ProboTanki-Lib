from codec.base import CustomBaseCodec
from codec.primitive import FloatCodec, IntCodec, StringCodec

class TankDamageCodec(CustomBaseCodec):
    attributes = ["damage", "damageType", "target"]
    codecs = [FloatCodec, IntCodec, StringCodec]