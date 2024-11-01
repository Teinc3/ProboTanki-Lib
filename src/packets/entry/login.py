from packets.abstractpacket import AbstractPacket

from codec.primitive.stringcodec import StringCodec
from codec.primitive.boolcodec import BoolCodec


class Login(AbstractPacket):
    id = -739684591
    description = 'Login information sent by the client'
    codecs = [StringCodec, StringCodec, BoolCodec]
    attributes = ["username", "password", "rememberMe"]