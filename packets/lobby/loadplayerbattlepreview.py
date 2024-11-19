from codec.custom import BattleNotifierCodec
from packets.abstractpacket import AbstractPacket


class Load_Player_Battle_Preview(AbstractPacket):
    id = -1895446889
    description = 'Loads battle preview data of a player (Such as score)'
    codecs = [BattleNotifierCodec]
    attributes = ["battleNotifier"]
    shouldLog = False
