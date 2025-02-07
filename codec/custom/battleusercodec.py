from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec
from ..primitive import IntCodec, ByteCodec


class BattleUserCodec(CustomBaseCodec):
    attributes = ['modLevel', 'deaths', 'kills', 'rank', 'score', 'username']
    codecs = [IntCodec, IntCodec, IntCodec, ByteCodec, IntCodec, StringCodec]
