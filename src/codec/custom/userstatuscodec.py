from codec.base import CustomBaseCodec
from codec.primitive import IntCodec, BoolCodec
from codec.complex import StringCodec


class UserStatusCodec(CustomBaseCodec):
    attributes = ['modLevel', 'ip', 'rank', 'username']
    codecs = [IntCodec, StringCodec, IntCodec, StringCodec]
    shortern = True
