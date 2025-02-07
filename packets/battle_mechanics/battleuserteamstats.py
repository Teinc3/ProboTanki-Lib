from ...codec.custom import UserStatsCodec
from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Battle_User_Team_Stats(AbstractPacket):
    id = -497293992
    description = "Battle user stats"
    codecs = [UserStatsCodec, IntCodec]
    attributes = ['usersStat', 'team']
