from ..custombasecodec import CustomBaseCodec
from ..complex import PascalStringCodec
from ..primitive import IntCodec, LongCodec


class ClanMemberStatsCodec(CustomBaseCodec):
    attributes = ['timeInClan', 'lost', 'destroyed', 'lastVisit', 'position', 'experience',
                  'unknownInt1', 'name', 'minesUsed', 'score', 'weekScore']
    codecs = [IntCodec, IntCodec, IntCodec, LongCodec, IntCodec, IntCodec,
              IntCodec, PascalStringCodec, IntCodec, IntCodec, IntCodec]

# One member's full stats record, sent inside Clan_Profile_In (the packet you get after
# requesting a specific clan's profile by tag) -- unlike ClanElementCodec's 'members',
# which is just names, this carries full per-member data.
