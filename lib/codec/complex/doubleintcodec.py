from ..factory import MultiTypeCodecFactory
from ..primitive import IntCodec


def DoubleIntCodecFactory(attribute1: str, attribute2: str):
    return MultiTypeCodecFactory([attribute1, attribute2], IntCodec)
