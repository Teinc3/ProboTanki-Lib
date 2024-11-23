from lib.codec.base import CustomBaseCodec
from lib.codec.complex import StringCodec
from lib.codec.primitive import IntCodec


class UserStatsCodec(CustomBaseCodec):
    attributes = ["deaths", "kills", "score", "username"]
    codecs = [IntCodec, IntCodec, IntCodec, StringCodec]
