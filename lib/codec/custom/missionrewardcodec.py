from lib.codec.base import CustomBaseCodec
from lib.codec.complex import StringCodec
from lib.codec.primitive import IntCodec


class MissionRewardCodec(CustomBaseCodec):
    attributes = ["amount", "name"]
    codecs = [IntCodec, StringCodec]
