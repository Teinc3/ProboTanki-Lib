from codec.base import CustomBaseCodec
from codec.primitive import IntCodec, BoolCodec


class MissionStreakCodec(CustomBaseCodec):
    attributes = ["level", "streak", "doneToday", "questImgID", "rewardImgID"]
    codecs = [IntCodec, IntCodec, BoolCodec, IntCodec, IntCodec]
