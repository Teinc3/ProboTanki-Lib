from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec
from ..primitive import IntCodec


class UserStatsCodec(CustomBaseCodec):
    attributes = ["deaths", "kills", "score", "username"]
    codecs = [IntCodec, IntCodec, IntCodec, StringCodec]
