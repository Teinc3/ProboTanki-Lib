from codec.base import CustomBaseCodec
from codec.primitive import BoolCodec, IntCodec
from codec.complex import StringCodec
from codec.custom.missionrewardcodec import MissionRewardCodec
from codec.factory import VectorCodecFactory


class MissionCodec(CustomBaseCodec):
    attributes = ["freeChange", "description", "threshold", "image", "rewards", "progress", "missionID", "changeCost"]
    codecs = [BoolCodec, StringCodec, IntCodec, IntCodec, VectorCodecFactory(MissionRewardCodec), IntCodec, IntCodec, IntCodec]
