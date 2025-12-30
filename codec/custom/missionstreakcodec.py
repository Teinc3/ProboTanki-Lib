from ..custombasecodec import CustomBaseCodec
from ..primitive import IntCodec, BoolCodec, LongCodec


class MissionStreakCodec(CustomBaseCodec):
    attributes = ["level", "streak", "doneToday", "questImgID", "rewardImgID"]
    codecs = [IntCodec, IntCodec, BoolCodec, LongCodec, LongCodec]
