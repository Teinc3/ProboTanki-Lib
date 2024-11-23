from lib.codec.complex import StringCodec
from lib.codec.primitive import IntCodec
from lib.packets.abstractpacket import AbstractPacket


class Load_Rank(AbstractPacket):
    id = -962759489
    description = "Loads the rank of a player"
    codecs = [IntCodec, StringCodec]
    attributes = ['rank', 'username']
    shouldLog = False
