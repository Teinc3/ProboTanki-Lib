from lib.codec.complex import StringCodec
from lib.codec.primitive import BoolCodec
from lib.packets import AbstractPacket


class Email(AbstractPacket):
    id = 613462801
    description = "email"
    codecs = [StringCodec, BoolCodec]
    attributes = ['email', "emailConfirmed"]
