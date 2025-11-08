from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec
from ..primitive import IntCodec, ShortCodec, ByteCodec


class BattleUserCodec(CustomBaseCodec):
    attributes = ['modLevel', 'deaths', 'kills', 'rank', 'score', 'username']
    codecs = [IntCodec, ShortCodec, ShortCodec, ByteCodec, IntCodec, StringCodec]
