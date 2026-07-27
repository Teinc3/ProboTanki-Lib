from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec, PascalStringCodec
from ..primitive import LongCodec, ByteCodec, IntCodec
from ..factory import VectorCodecFactory
from .clanmemberstatscodec import ClanMemberStatsCodec

ClanMemberStatsListCodec = VectorCodecFactory(dict, ClanMemberStatsCodec)


class ClanProfileCodec(CustomBaseCodec):
    attributes = ['unusedByte0', 'creationDate', 'leaderName', 'infoText', 'unknownByte1',
                  'unknownInt1', 'unknownByte2', 'unknownByte3', 'unknownInt2', 'name',
                  'unknownByte4', 'unknownInt3', 'unknownByte5', 'unknownByte6', 'tag',
                  'members', 'bannerPath', 'score']
    codecs = [ByteCodec, LongCodec, StringCodec, StringCodec, ByteCodec, IntCodec,
              ByteCodec, ByteCodec, IntCodec, PascalStringCodec, ByteCodec, IntCodec,
              ByteCodec, ByteCodec, PascalStringCodec, ClanMemberStatsListCodec,
              StringCodec, IntCodec]

# Full clan profile record for Clan_Profile_In (response to requesting a clan's profile by
# tag). Opens the same as ClanElementCodec (unusedByte0+creationDate+leaderName+infoText)
# but the filler-byte layout after infoText differs -- 3 fewer bytes before 'name', no
# field between 'tag' and the member list -- so it's a distinct codec, not a reuse.
# 'members' is a list of ClanMemberStatsCodec records, not plain names.
