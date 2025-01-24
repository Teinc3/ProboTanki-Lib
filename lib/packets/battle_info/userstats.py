from lib.codec.custom import BattleUserStatsCodec
from lib.codec.factory import VectorCodecFactory
from lib.packets.abstractpacket import AbstractPacket


class Battle_User_Stats(AbstractPacket):
    id = 1061006142
    description = "Battle User Stats"
    codecs = [VectorCodecFactory(dict, BattleUserStatsCodec)]
    attributes = ["usersStat"]
