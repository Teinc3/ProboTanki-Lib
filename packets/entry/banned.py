from ...packets import AbstractPacket

from ...codec.complex import StringCodec


class Banned(AbstractPacket):
    id = -600078553
    description = "Account banned"
    attributes = ["reason"]
    codecs = [StringCodec]