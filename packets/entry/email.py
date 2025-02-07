from ...codec.complex import StringCodec
from ...codec.primitive import BoolCodec
from ...packets import AbstractPacket


class Email(AbstractPacket):
    id = 613462801
    description = "email"
    codecs = [StringCodec, BoolCodec]
    attributes = ['email', "emailConfirmed"]
