from lib.codec.complex import StringCodec
from lib.codec.primitive import BoolCodec
from lib.packets import AbstractPacket


class Create_Account(AbstractPacket):
    id = 427083290
    description = 'Create new account'
    codecs = [StringCodec, StringCodec, BoolCodec]
    attributes = ["username", "password", "rememberMe"]
