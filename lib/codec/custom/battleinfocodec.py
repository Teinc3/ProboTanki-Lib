from lib.codec.base import CustomBaseCodec
from lib.codec.complex import StringCodec
from lib.codec.primitive import BoolCodec, IntCodec
from .rankrangecodec import RankRangeCodec


class BattleInfoCodec(CustomBaseCodec):
    attributes = ["battleID", "mapName", "mode", "private", "proBattle", "range", "serverNumber"]
    codecs = [StringCodec, StringCodec, IntCodec, BoolCodec, BoolCodec, RankRangeCodec, IntCodec]
