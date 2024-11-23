from lib.codec.complex import StringCodec
from lib.codec.custom import MoveCodec
from lib.packets.abstractpacket import AbstractPacket


class Moved(AbstractPacket):
    id = -64696933
    description = "Receives movement data of a player from the server."
    attributes = ['username', 'movement']
    codecs = [StringCodec, MoveCodec]
