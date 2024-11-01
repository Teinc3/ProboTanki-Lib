from codec.base import CustomBaseCodec
from codec.primitive import StringCodec, IntCodec


class UserStatsCodec(CustomBaseCodec):
    attributes = ["deaths", "kills", "score", "username"]
    codecs = [IntCodec, IntCodec, IntCodec, StringCodec]