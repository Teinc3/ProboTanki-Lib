from codec.base import CustomBaseCodec
from codec.primitive import BoolCodec, IntCodec
from codec.complex import StringCodec
from .rankrangecodec import RankRangeCodec


class BattleInfoCodec(CustomBaseCodec):
    attributes = ["battleID", "mapName", "mode", "private", "proBattle", "range", "serverNumber"]
    codecs = [StringCodec, StringCodec, IntCodec, BoolCodec, BoolCodec, RankRangeCodec, IntCodec]
