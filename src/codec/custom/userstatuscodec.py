from codec.base import CustomBaseCodec
from codec.primitive import StringCodec, IntCodec

class UserStatusCodec(CustomBaseCodec):
    attributes = ['modLevel', 'ip', 'rank', 'username']
    codecs = [IntCodec, StringCodec, IntCodec, StringCodec]

    # The encoded version has 5 attributes but username duplicates
    # Also pretty confident client doesn't use "encode" so there's no need to override it