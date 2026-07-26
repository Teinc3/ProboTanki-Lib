from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec, PascalStringCodec, ClanMemberListCodec
from ..primitive import LongCodec, ByteCodec, IntCodec

class ClanElementCodec(CustomBaseCodec):
    """
        creationDate was originally mis-split as an 8-byte "clanId" Long
        followed by a 1-byte "unknownFlag". The true 8-byte Long boundary
        sits one byte later: unusedByte0 + creationDate, a Java-epoch-millisecond timestamp. Rolls over 
        to the stated date in any timezone ahead of UTC. Total byte width is unchanged from the old
        Long(8)+Byte(1) split, so this is a relabeling, not a new field.
    """

    attributes = [
        'unusedByte0',
        'creationDate',
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
        ByteCodec,
        LongCodec,
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
