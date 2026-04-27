from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec
from ..primitive import LongCodec


class BonusInfoCodec(CustomBaseCodec):
    attributes = ["bottomText", "image", "topText"]
    codecs = [StringCodec, LongCodec, StringCodec]


__all__ = ['BonusInfoCodec']
