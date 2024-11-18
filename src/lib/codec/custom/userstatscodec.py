from codec.base import CustomBaseCodec
from codec.complex import StringCodec
from codec.primitive import IntCodec


class UserStatsCodec(CustomBaseCodec):
    attributes = ["deaths", "kills", "score", "username"]
    codecs = [IntCodec, IntCodec, IntCodec, StringCodec]
