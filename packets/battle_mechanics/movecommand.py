from ...codec.complex import StringCodec
from ...codec.custom import MoveCodec
from ...codec.primitive import FloatCodec
from ...packets import AbstractPacket


class Move_Command(AbstractPacket):
    id = 1516578027
    description = "Receives movement data of a player from the server."
    attributes = ['username', 'movement', 'turretDirection']
    codecs = [StringCodec, MoveCodec, FloatCodec]
