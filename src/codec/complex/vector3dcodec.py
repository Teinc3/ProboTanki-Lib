from ..primitive import FloatCodec
from ..factory import MultiTypeCodecFactory

Vector3DCodec = MultiTypeCodecFactory(["x", "y", "z"], FloatCodec, True)
