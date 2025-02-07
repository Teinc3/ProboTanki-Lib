from ...packets import AbstractPacket
from ...codec.complex import StringCodec


class User_Changed_Equipment(AbstractPacket):
    id = -1767633906
    description = "User Changed Equipment"
    codecs = [StringCodec]
    attributes = ['tank']
