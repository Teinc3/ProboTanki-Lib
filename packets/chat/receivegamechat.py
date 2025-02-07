from ...codec.complex import StringCodec
from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Receive_Game_Chat(AbstractPacket):
    id = 1259981343
    description = "Receives a message from the game chat"
    codecs = [StringCodec, StringCodec, IntCodec]
    attributes = ['username', 'message', 'team']
