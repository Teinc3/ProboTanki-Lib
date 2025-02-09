from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Send_Lobby_Chat(AbstractPacket):
    id = 705454610
    description = "Sends a chat message to the lobby"
    codecs = [StringCodec, StringCodec]
    attributes = ['username', 'message']