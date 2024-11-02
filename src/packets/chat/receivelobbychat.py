from packets.abstractpacket import AbstractPacket

from codec.custom.chatmessagecodec import ChatMessageCodec
from codec.complex import VectorCodecFactory


class Receive_Lobby_Chat(AbstractPacket):
    id = -1263520410
    description = "Receives chat messages from the lobby"
    codecs = [VectorCodecFactory(dict, ChatMessageCodec)]
    attributes = ["messages"]