from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec
from ..primitive import IntCodec


class BattleUserStatsCodec(CustomBaseCodec):
    attributes = ["deaths", "kills", "score", "user"]
    codecs = [IntCodec, IntCodec, IntCodec, StringCodec]
