from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec
from ..primitive import IntCodec, ShortCodec


class BattleUserStatsCodec(CustomBaseCodec):
    attributes = ["deaths", "kills", "score", "user"]
    codecs = [ShortCodec, ShortCodec, IntCodec, StringCodec]
