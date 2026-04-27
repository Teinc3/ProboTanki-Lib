from ...packets import AbstractPacket
from ...codec.complex import StringCodec


class Email_Request(AbstractPacket):
    id = -20486732
    description = "Request to change email"
    codecs = [StringCodec]
    attributes = ['email']


__all__ = ['Email_Request']
