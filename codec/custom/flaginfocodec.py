from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec, Vector3DCodec


class FlagInfoCodec(CustomBaseCodec):
    attributes = ["pole_pos", "holder", "current_pos"]
    codecs = [Vector3DCodec, StringCodec, Vector3DCodec]


__all__ = ['FlagInfoCodec']
