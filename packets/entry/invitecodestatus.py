from ...codec.primitive import BoolCodec
from ...packets import AbstractPacket


class Invite_Code_Status(AbstractPacket):
    id = 444933603
    description = "Do we need an invite code to access the server?"
    codecs = [BoolCodec]
    attributes = ["inviteEnabled"]
