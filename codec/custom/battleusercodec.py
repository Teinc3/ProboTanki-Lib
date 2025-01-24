from lib.codec.base import CustomBaseCodec
from lib.codec.complex import StringCodec
from lib.codec.primitive import IntCodec, ByteCodec


class BattleUserCodec(CustomBaseCodec):
    attributes = ['modLevel', 'deaths', 'kills', 'rank', 'score', 'username']
    codecs = [IntCodec, IntCodec, IntCodec, ByteCodec, IntCodec, StringCodec]
