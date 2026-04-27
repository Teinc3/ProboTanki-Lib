from ...packets import AbstractPacket
from ...codec.complex import StringCodec


class Update_PW_Email(AbstractPacket):
    id = 147737736
    description = "Request to change password email"
    codecs = [StringCodec, StringCodec]
    attributes = ['password', 'email']


__all__ = ['Update_PW_Email']
