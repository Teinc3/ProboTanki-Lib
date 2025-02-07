from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec
from ..primitive import IntCodec


class BattleUserRewardsCodec(CustomBaseCodec):
    attributes = ["newbiesAbonementBonusReward", "premiumBonusReward", "reward", "userid"]
    codecs = [IntCodec, IntCodec, IntCodec, StringCodec]
