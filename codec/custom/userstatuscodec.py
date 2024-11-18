from codec.base import CustomBaseCodec
from codec.complex import StringCodec
from codec.primitive import IntCodec


class UserStatusCodec(CustomBaseCodec):
    attributes = ['modLevel', 'ip', 'rank', 'username']
    codecs = [IntCodec, StringCodec, IntCodec, StringCodec]
    shortern = True
