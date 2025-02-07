from ...codec.complex import StringCodec
from ...codec.custom import BattleInfoUserCodec
from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Joined_Selected_Team_Battle(AbstractPacket):
    id = 118447426
    description = "Sent when a player joins the currently-selected Team battle."
    attributes = ["battleID", "userInfo", "team"]
    codecs = [StringCodec, BattleInfoUserCodec, IntCodec]
    shouldLog = False
