from lib.codec.base import CustomBaseCodec
from lib.codec.complex import StringCodec
from lib.codec.factory import VectorCodecFactory
from lib.codec.primitive import BoolCodec, IntCodec
from .missionrewardcodec import MissionRewardCodec


class MissionCodec(CustomBaseCodec):
    attributes = ["freeChange", "description", "threshold", "image", "rewards", "progress", "missionID", "changeCost"]
    codecs = [BoolCodec, StringCodec, IntCodec, IntCodec, VectorCodecFactory(dict, MissionRewardCodec), IntCodec,
              IntCodec, IntCodec]
