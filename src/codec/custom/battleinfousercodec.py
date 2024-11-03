from codec.base import CustomBaseCodec

from codec.primitive import BoolCodec, IntCodec
from codec.complex import StringCodec


class BattleInfoUserCodec(CustomBaseCodec):
    attributes = ["kills", "score", "suspicious", "user"]
    codecs = [IntCodec, IntCodec, BoolCodec, StringCodec]
