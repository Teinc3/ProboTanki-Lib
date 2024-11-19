from codec.base import CustomBaseCodec
from codec.primitive import BoolCodec, IntCodec
from codec.complex import StringCodec
from codec.factory import VectorCodecFactory
from .missionrewardcodec import MissionRewardCodec


class MissionCodec(CustomBaseCodec):
    attributes = ["freeChange", "description", "threshold", "image", "rewards", "progress", "missionID", "changeCost"]
    codecs = [BoolCodec, StringCodec, IntCodec, IntCodec, VectorCodecFactory(dict, MissionRewardCodec), IntCodec, IntCodec, IntCodec]
