from packets.abstractpacket import AbstractPacket

from codec.primitive import StringCodec, BoolCodec


class Send_Game_Chat(AbstractPacket):
    id = 945463181
    description = "Sends a message to the game chat"
    codecs = [StringCodec, BoolCodec]
    attributes = ['message', 'teamOnly']