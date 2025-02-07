from ...packets import AbstractPacket

from ...codec.complex import StringCodec
from ...codec.factory import VectorCodecFactory
from ...codec.custom import BattleUserCodec


class Load_New_Player_DM(AbstractPacket):
    id = 862913394
    description = 'A new player has joined the battle'
    attributes = ['username', 'userinfos']
    codecs = [StringCodec, VectorCodecFactory(dict, BattleUserCodec)]