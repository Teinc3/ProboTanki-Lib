from ...codec.custom import BattleUserStatsCodec
from ...codec.factory import VectorCodecFactory
from ...packets import AbstractPacket


class Battle_User_Stats(AbstractPacket):
    id = 1061006142
    description = "Battle User Stats"
    codecs = [VectorCodecFactory(dict, BattleUserStatsCodec)]
    attributes = ["usersStat"]
