from ...packets import AbstractPacket
from ...codec.primitive import IntCodec
from ...codec.custom import ClanElementCodec
from ...codec.factory import VectorCodecFactory

VectorClanElementCodec = VectorCodecFactory(dict, ClanElementCodec)


class Clan_Leaderboard_In(AbstractPacket):


    id = 134406915
    description = 'Clan Leaderboard'
    attributes = ['startIndex', 'clans']
    codecs = [IntCodec, VectorClanElementCodec]
