from lib.codec.complex import StringCodec
from lib.codec.custom import MoveCodec
from lib.codec.primitive import FloatCodec
from lib.packets.abstractpacket import AbstractPacket


class Move_Command(AbstractPacket):
    id = 1516578027
    description = "Receives movement data of a player from the server."
    attributes = ['tankid', 'movement', 'turretDirection']
    codecs = [StringCodec, MoveCodec, FloatCodec]
