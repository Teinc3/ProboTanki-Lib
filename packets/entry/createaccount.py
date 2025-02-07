from ...codec.complex import StringCodec
from ...codec.primitive import BoolCodec
from ...packets import AbstractPacket


class Create_Account(AbstractPacket):
    id = 427083290
    description = 'Create new account'
    codecs = [StringCodec, StringCodec, BoolCodec]
    attributes = ["username", "password", "rememberMe"]
