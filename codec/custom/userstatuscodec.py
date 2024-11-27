from lib.codec.base import CustomBaseCodec
from lib.codec.complex import StringCodec
from lib.codec.primitive import IntCodec


class UserStatusCodec(CustomBaseCodec):
    attributes = ['modLevel', 'ip', 'rank', 'username']
    codecs = [IntCodec, StringCodec, IntCodec, StringCodec]
    boolshortern = True
