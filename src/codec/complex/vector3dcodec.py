from codec.base import BaseCodec
from codec.primitive import FloatCodec


class Vector3DCodec(BaseCodec):
    attributes = ["x", "y", "z"]
    codecs = [FloatCodec] * 3