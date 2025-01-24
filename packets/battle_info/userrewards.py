from lib.codec.custom import BattleUserRewardsCodec
from lib.codec.factory import VectorCodecFactory
from lib.codec.primitive import IntCodec
from lib.packets import AbstractPacket


class Battle_User_Rewards(AbstractPacket):
    id = 560336625
    description = "Battle User Rewards"
    codecs = [VectorCodecFactory(dict, BattleUserRewardsCodec), IntCodec]
    attributes = ["reward", "timeToRestart"]
