from ...codec.complex import StringCodec
from ...codec.custom import MoveCodec
from ...packets import AbstractPacket


class Moved(AbstractPacket):
    id = -64696933
    description = "Receives movement data of a player from the server."
    attributes = ['username', 'movement']
    codecs = [StringCodec, MoveCodec]
