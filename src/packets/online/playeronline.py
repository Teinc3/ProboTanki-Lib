from packets.abstractpacket import AbstractPacket

from codec.primitive import IntCodec, BoolCodec
from codec.complex import StringCodec


class Player_Online(AbstractPacket):
    id = 2041598093
    description = "Updates Player's Online Status"
    codecs = [BoolCodec, IntCodec, StringCodec]
    attributes = ['online', 'serverID', 'username']
    shouldLog = False