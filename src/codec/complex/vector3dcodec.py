from codec.base import CustomBaseCodec
from codec.primitive import FloatCodec


class Vector3DCodec(CustomBaseCodec):
    attributes = ["x", "y", "z"]
    codecs = [FloatCodec] * 3
    shortern = True