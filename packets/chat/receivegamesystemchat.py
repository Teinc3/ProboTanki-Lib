from ...packets import AbstractPacket
from ...codec.complex import StringCodec


class Receive_Game_System_Chat(AbstractPacket):
    id = 606668848
    description = "Received a system message in the game chat"
    codecs = [StringCodec]
    attributes = ['message']