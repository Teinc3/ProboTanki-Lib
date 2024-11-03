from codec.complex import StringCodec
from codec.custom.battleinfousercodec import BattleInfoUserCodec
from codec.primitive import IntCodec
from packets.abstractpacket import AbstractPacket


class Joined_Team_Battle(AbstractPacket):
    id = 118447426
    description = "Sent when a player joins a Team battle."
    attributes = ["battleID", "userInfo", "team"]
    codecs = [StringCodec, BattleInfoUserCodec, IntCodec]
    shouldLog = False
