from ..primitive import IntCodec
from ..factory import MultiTypeCodecFactory


def DoubleIntCodecFactory(attribute1: str, attribute2: str):
    return MultiTypeCodecFactory([attribute1, attribute2], IntCodec)