from ..custombasecodec import CustomBaseCodec
from ..primitive import IntCodec
from ..complex import StringCodec


class ReferralDataCodec(CustomBaseCodec):
    attributes = ['income', 'username']
    codecs = [IntCodec, StringCodec]


__all__ = ['ReferralDataCodec']