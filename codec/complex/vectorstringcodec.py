from .stringcodec import StringCodec
from ..factory import VectorCodecFactory

VectorStringCodec = VectorCodecFactory(str, StringCodec, True)
