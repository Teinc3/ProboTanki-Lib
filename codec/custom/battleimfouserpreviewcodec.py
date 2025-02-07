from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec
from ..primitive import BoolCodec, IntCodec


class BattleInfoUserCodec(CustomBaseCodec):
    attributes = ["kills", "score", "suspicious", "user"]
    codecs = [IntCodec, IntCodec, BoolCodec, StringCodec]
