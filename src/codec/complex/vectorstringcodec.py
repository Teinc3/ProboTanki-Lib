from codec.complex import VectorCodecFactory, StringCodec

VectorStringCodec = VectorCodecFactory(str, StringCodec, True)