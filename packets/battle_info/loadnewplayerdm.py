from lib.packets import AbstractPacket

from lib.codec.complex import StringCodec
from lib.codec.factory import VectorCodecFactory
from lib.codec.custom import BattleUserCodec


class Load_New_Player_DM(AbstractPacket):
    id = 862913394
    description = 'A new player has joined the battle'
    attributes = ['username', 'userinfos']
    codecs = [StringCodec, VectorCodecFactory(dict, BattleUserCodec)]