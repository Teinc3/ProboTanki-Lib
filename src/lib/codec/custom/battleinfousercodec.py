from codec.base import CustomBaseCodec
from codec.complex import StringCodec
from codec.primitive import BoolCodec, IntCodec


class BattleInfoUserCodec(CustomBaseCodec):
    attributes = ["kills", "score", "suspicious", "user"]
    codecs = [IntCodec, IntCodec, BoolCodec, StringCodec]
