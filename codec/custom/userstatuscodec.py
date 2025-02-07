from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec
from ..primitive import IntCodec


class UserStatusCodec(CustomBaseCodec):
    attributes = ['modLevel', 'ip', 'rank', 'username']
    codecs = [IntCodec, StringCodec, IntCodec, StringCodec]
    boolshortern = True
