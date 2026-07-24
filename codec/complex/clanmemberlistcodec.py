from .stringcodec import StringCodec
from ..factory import ByteCountVectorCodecFactory

ClanMemberListCodec = ByteCountVectorCodecFactory(str, StringCodec)
