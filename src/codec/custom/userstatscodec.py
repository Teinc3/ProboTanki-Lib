from codec.base import CustomBaseCodec
from codec.primitive import IntCodec
from codec.complex import StringCodec


class UserStatsCodec(CustomBaseCodec):
    attributes = ["deaths", "kills", "score", "username"]
    codecs = [IntCodec, IntCodec, IntCodec, StringCodec]
