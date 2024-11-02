from codec.base import CustomBaseCodec

from codec.primitive import BoolCodec, IntCodec
from codec.complex import StringCodec, DoubleIntCodec


class BattleInfoCodec(CustomBaseCodec):
    attributes = ["battleID", "mapName", "mode", "private", "proBattle", "range", "serverNumber"]
    codecs = [StringCodec, StringCodec, IntCodec, BoolCodec, BoolCodec, DoubleIntCodec, IntCodec]