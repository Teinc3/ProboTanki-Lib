from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec
from ..factory import VectorCodecFactory
from ..primitive import BoolCodec, IntCodec, LongCodec
from .missionrewardcodec import MissionRewardCodec


class MissionCodec(CustomBaseCodec):
    attributes = ["freeChange", "description", "threshold", "image", "rewards", "progress", "missionID", "changeCost"]
    codecs = [BoolCodec, StringCodec, IntCodec, LongCodec, VectorCodecFactory(dict, MissionRewardCodec), IntCodec,
              IntCodec, IntCodec]
