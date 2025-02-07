from ...packets import AbstractPacket

from ...codec.primitive import IntCodec
from ...codec.complex import StringCodec
from ...codec.custom import BattleUserCodec
from ...codec.factory import VectorCodecFactory


class Load_New_Player_Team(AbstractPacket):
    id = 2040021062
    description = 'A new player has joined the team battle'
    attributes = ['username', 'userinfos', 'team']
    codecs = [StringCodec, VectorCodecFactory(dict, BattleUserCodec), IntCodec]