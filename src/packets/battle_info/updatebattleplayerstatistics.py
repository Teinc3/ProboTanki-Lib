from packets.abstractpacket import AbstractPacket

from codec.custom.userstatscodec import UserStatsCodec

class Update_Battle_Player_Statistics(AbstractPacket):
    id = 34068208
    description = "Updates the in-battle statistics of a player."
    codecs = [UserStatsCodec]
    attributes = ['userStats']