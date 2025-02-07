from ...codec.custom import ChatMessageCodec
from ...codec.factory import VectorCodecFactory
from ...packets import AbstractPacket


class Receive_Lobby_Chat(AbstractPacket):
    id = -1263520410
    description = "Receives chat messages from the lobby"
    codecs = [VectorCodecFactory(dict, ChatMessageCodec)]
    attributes = ["messages"]
