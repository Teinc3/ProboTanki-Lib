from ...codec.primitive import IntCodec, BoolCodec
from ...packets import AbstractPacket


class Login_Ready(AbstractPacket):
    id = -1277343167
    description = 'Server sends options for Login'
    codecs = [IntCodec, BoolCodec, IntCodec, IntCodec]
    attributes = ["bgResourceID", "requireEmail", "maxPWLen", "minPWLen"]
