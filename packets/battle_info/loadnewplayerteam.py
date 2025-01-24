from lib.packets import AbstractPacket

from lib.codec.primitive import IntCodec
from lib.codec.complex import StringCodec
from lib.codec.custom import BattleUserCodec
from lib.codec.factory import VectorCodecFactory


class Load_New_Player_Team(AbstractPacket):
    id = 2040021062
    description = 'A new player has joined the team battle'
    attributes = ['username', 'userinfos', 'team']
    codecs = [StringCodec, VectorCodecFactory(dict, BattleUserCodec), IntCodec]