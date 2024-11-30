from lib.codec.custom import BattleNotifierCodec
from lib.packets.abstractpacket import AbstractPacket


class Joined_Battle_Status(AbstractPacket):
    id = -1895446889
    description = 'Loads battle status data of a player'
    codecs = [BattleNotifierCodec]
    attributes = ["battleNotifier"]
    shouldLog = False
