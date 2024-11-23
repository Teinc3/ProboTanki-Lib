from lib.codec.complex import StringCodec
from lib.codec.custom import BattleInfoUserCodec
from lib.packets.abstractpacket import AbstractPacket


class Joined_DM_Battle(AbstractPacket):
    id = -911626491
    description = "Sent when a player joins a DM battle."
    attributes = ["battleID", "userInfo"]
    codecs = [StringCodec, BattleInfoUserCodec]
    shouldLog = False
