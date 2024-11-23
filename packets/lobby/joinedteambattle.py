from lib.codec.complex import StringCodec
from lib.codec.custom import BattleInfoUserCodec
from lib.codec.primitive import IntCodec
from lib.packets.abstractpacket import AbstractPacket


class Joined_Team_Battle(AbstractPacket):
    id = 118447426
    description = "Sent when a player joins a Team battle."
    attributes = ["battleID", "userInfo", "team"]
    codecs = [StringCodec, BattleInfoUserCodec, IntCodec]
    shouldLog = False
