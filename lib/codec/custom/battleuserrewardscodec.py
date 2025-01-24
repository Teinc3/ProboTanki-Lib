from lib.codec.base import CustomBaseCodec
from lib.codec.complex import StringCodec
from lib.codec.primitive import IntCodec


class BattleUserRewardsCodec(CustomBaseCodec):
    attributes = ["newbiesAbonementBonusReward", "premiumBonusReward", "reward", "userid"]
    codecs = [IntCodec, IntCodec, IntCodec, StringCodec]
