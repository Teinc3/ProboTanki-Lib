from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Wipe_Lobby_Messages(AbstractPacket):
    id = 1993050216
    description = "Wipes all messages by a user in the lobby"
    codecs = [StringCodec]
    attributes = ['username']
