from ..primitive import ShortCodec
from ..factory import VectorCodecFactory

VectorShortCodec = VectorCodecFactory(int, ShortCodec, True)