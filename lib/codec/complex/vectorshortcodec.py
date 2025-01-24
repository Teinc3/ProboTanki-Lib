from ..factory import VectorCodecFactory
from ..primitive import ShortCodec

VectorShortCodec = VectorCodecFactory(int, ShortCodec, True)
