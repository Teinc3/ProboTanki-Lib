from ...codec.custom import BattleUserRewardsCodec
from ...codec.factory import VectorCodecFactory
from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Battle_User_Rewards(AbstractPacket):
    id = 560336625
    description = "Battle User Rewards"
    codecs = [VectorCodecFactory(dict, BattleUserRewardsCodec), IntCodec]
    attributes = ["reward", "timeToRestart"]
