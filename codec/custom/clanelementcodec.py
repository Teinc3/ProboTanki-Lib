from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec, PascalStringCodec, ClanMemberListCodec
from ..primitive import LongCodec, ByteCodec, IntCodec


class ClanElementCodec(CustomBaseCodec):
    attributes = ['unusedByte0', 'creationDate', 'leaderName', 'infoText', 'unknownByte1', 'unknownInt1',
                  'maxMembers', 'unknownByte2', 'unknownInt2', 'name', 'unknownByte3', 'unknownByte4',
                  'unknownInt3', 'tag', 'unknownInt4', 'members', 'bannerPath', 'score']
    codecs = [ByteCodec, LongCodec, StringCodec, StringCodec, ByteCodec, IntCodec,
              IntCodec, ByteCodec, IntCodec, PascalStringCodec, ByteCodec, ByteCodec,
              IntCodec, PascalStringCodec, IntCodec, ClanMemberListCodec, StringCodec, IntCodec]

# creationDate was originally mis-split as an 8-byte "clanId" Long followed by a 1-byte
# "unknownFlag" -- there's no separate clan-id field. The real Long boundary sits one byte
# later: unusedByte0 + creationDate, a Java-epoch-millisecond timestamp.
# Same total width as before (Long(8)+Byte(1)), so this is a relabel, not a new field.
