from .. import AbstractPacket
from ...codec.complex import StringCodec


class Email_Confirming(AbstractPacket):
    id = 2145091885
    description = "Email request awaiting confirmation"
    attributes = ['message']
    codecs = [StringCodec]


__all__ = ['Email_Confirming']
