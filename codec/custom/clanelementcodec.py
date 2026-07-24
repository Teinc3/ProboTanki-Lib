from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec, PascalStringCodec, ClanMemberListCodec
from ..primitive import LongCodec, ByteCodec, IntCodec


class ClanElementCodec(CustomBaseCodec):

    attributes = [
        'clanId',
        'unknownFlag',
        'leaderName',
        'infoText',
        'unknownByte1',
        'unknownInt1',
        'maxMembers',
        'unknownByte2',
        'unknownInt2',
        'name',
        'unknownByte3',
        'unknownByte4',
        'unknownInt3',
        'tag',
        'unknownInt4',
        'members',
        'bannerPath',
        'score',
    ]
    codecs = [
        LongCodec,
        ByteCodec,
        StringCodec,
        StringCodec,
        ByteCodec,
        IntCodec,
        IntCodec,
        ByteCodec,
        IntCodec,
        PascalStringCodec,
        ByteCodec,
        ByteCodec,
        IntCodec,
        PascalStringCodec,
        IntCodec,
        ClanMemberListCodec,
        StringCodec,
        IntCodec,
    ]
