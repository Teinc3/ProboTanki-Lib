from lib.codec.base import CustomBaseCodec
from lib.codec.complex import StringCodec
from lib.codec.primitive import IntCodec


class BattleUserStatsCodec(CustomBaseCodec):
    attributes = ["deaths", "kills", "score", "user"]
    codecs = [IntCodec, IntCodec, IntCodec, StringCodec]
