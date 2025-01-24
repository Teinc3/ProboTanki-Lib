from lib.codec.custom import UserStatsCodec
from lib.codec.primitive import IntCodec
from lib.packets.abstractpacket import AbstractPacket


class Battle_User_Team_Stats(AbstractPacket):
    id = -497293992
    description = "Battle user stats"
    codecs = [UserStatsCodec, IntCodec]
    attributes = ['usersStat', 'team']
