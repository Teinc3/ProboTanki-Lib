from packets.abstractpacket import AbstractPacket

from codec.complex import StringCodec
from codec.custom.movecodec import MoveCodec


class Move_IN(AbstractPacket):
    id = -64696933
    description = "Receives movement data of a player from the server."
    attributes = ['username', 'movement']
    codecs = [StringCodec, MoveCodec]