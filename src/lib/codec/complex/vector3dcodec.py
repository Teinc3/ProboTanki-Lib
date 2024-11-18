from ..factory import MultiTypeCodecFactory
from ..primitive import FloatCodec

Vector3DCodec = MultiTypeCodecFactory(["x", "y", "z"], FloatCodec, True)
