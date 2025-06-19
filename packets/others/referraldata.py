from ...packets import AbstractPacket
from ...codec.complex import StringCodec
from ...codec.factory import VectorCodecFactory
from ...codec.custom import ReferralDataCodec


class Referral_Data(AbstractPacket):
    id = 1587315905
    description = "Server sends us our referral data"
    attributes = ["referralData", "inviteLink", "banner", "inviteMessage"]
    codecs = [VectorCodecFactory(dict, ReferralDataCodec, False), StringCodec, StringCodec, StringCodec]


__all__ = ["Referral_Data"]