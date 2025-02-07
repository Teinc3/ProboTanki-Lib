from ...codec.custom import UserStatsCodec
from ...packets import AbstractPacket


class Update_Battle_Player_Statistics(AbstractPacket):
    id = 696140460
    description = "Updates the in-battle statistics of a player."
    codecs = [UserStatsCodec]
    attributes = ['userStats']
