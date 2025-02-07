from ...codec.custom import BattleNotifierCodec
from ...packets import AbstractPacket


class In_Battle_Status(AbstractPacket):
    id = -1895446889
    description = 'Sets the battle status of the player to the battle ID'
    codecs = [BattleNotifierCodec]
    attributes = ["battleNotifier"]
    shouldLog = False
