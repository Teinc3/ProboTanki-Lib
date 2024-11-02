from codec.primitive import ShortCodec
from codec.complex import VectorCodecFactory

VectorShortCodec = VectorCodecFactory(int, ShortCodec, True)