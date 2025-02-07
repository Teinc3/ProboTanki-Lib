from ...codec.complex import StringCodec
from ...codec.primitive import BoolCodec
from ...packets import AbstractPacket


class Login(AbstractPacket):
    id = -739684591
    description = 'Login information sent by the client'
    codecs = [StringCodec, StringCodec, BoolCodec]
    attributes = ["username", "password", "rememberMe"]
