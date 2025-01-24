from lib.codec.complex import StringCodec
from lib.codec.custom import BattleInfoUserCodec
from lib.packets import AbstractPacket


class Joined_Selected_DM_Battle(AbstractPacket):
    id = -911626491
    description = "Sent when a player joins the currently-selected DM battle."
    attributes = ["battleID", "userInfo"]
    codecs = [StringCodec, BattleInfoUserCodec]
    shouldLog = False
