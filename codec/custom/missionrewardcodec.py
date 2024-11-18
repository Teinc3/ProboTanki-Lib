from codec.base import CustomBaseCodec
from codec.primitive import IntCodec
from codec.complex import StringCodec


class MissionRewardCodec(CustomBaseCodec):
    attributes = ["amount", "name"]
    codecs = [IntCodec, StringCodec]
