from ...packets import AbstractPacket
from ...codec.primitive import IntCodec


class Clan_Leaderboard_Request(AbstractPacket):
    id = -2080893689
    description = 'Clan Leaderboard Request'
    attributes = ['startIndex', 'count']
    codecs = [IntCodec, IntCodec]
