from lib.codec.base import CustomBaseCodec
from lib.codec.complex import StringCodec
from lib.codec.primitive import BoolCodec, IntCodec


class BattleInfoUserCodec(CustomBaseCodec):
    attributes = ["kills", "score", "suspicious", "user"]
    codecs = [IntCodec, IntCodec, BoolCodec, StringCodec]
