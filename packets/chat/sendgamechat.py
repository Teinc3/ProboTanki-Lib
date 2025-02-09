from ...codec.complex import StringCodec
from ...codec.primitive import BoolCodec
from ...packets import AbstractPacket


class Send_Game_Chat(AbstractPacket):
    id = 945463181
    description = "Sends a message to the game chat"
    codecs = [StringCodec, BoolCodec]
    attributes = ['message', 'teamOnly']