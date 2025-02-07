from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec
from ..primitive import IntCodec


class MissionRewardCodec(CustomBaseCodec):
    attributes = ["amount", "name"]
    codecs = [IntCodec, StringCodec]
