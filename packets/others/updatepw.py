from .. import AbstractPacket
from ...codec.complex import StringCodec


class Update_PW(AbstractPacket):
    id = 668890771
    description = "Change Password"
    codecs = [StringCodec]
    attributes = ['oldPassword', 'newPassword']


__all__ = ['Update_PW']
