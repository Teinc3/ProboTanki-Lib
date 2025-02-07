from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec
from ..primitive import BoolCodec, IntCodec
from .rankrangecodec import RankRangeCodec


class BattleInfoCodec(CustomBaseCodec):
    attributes = ["battleID", "mapName", "mode", "private", "proBattle", "range", "serverNumber"]
    codecs = [StringCodec, StringCodec, IntCodec, BoolCodec, BoolCodec, RankRangeCodec, IntCodec]
