from lib.codec.complex import StringCodec
from lib.codec.primitive import BoolCodec
from lib.packets import AbstractPacket


class Send_Game_Chat(AbstractPacket):
    id = 945463181
    description = "Sends a message to the game chat"
    codecs = [StringCodec, BoolCodec]
    attributes = ['message', 'teamOnly']
