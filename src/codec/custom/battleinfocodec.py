from codec.base import CustomBaseCodec
from codec.complex import StringCodec
from codec.custom.rankrangecodec import RankRangeCodec
from codec.primitive import BoolCodec, IntCodec


class BattleInfoCodec(CustomBaseCodec):
    attributes = ["battleID", "mapName", "mode", "private", "proBattle", "range", "serverNumber"]
    codecs = [StringCodec, StringCodec, IntCodec, BoolCodec, BoolCodec, RankRangeCodec, IntCodec]
