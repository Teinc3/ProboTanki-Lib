from packets.abstractpacket import AbstractPacket

from codec.primitive import StringCodec, IntCodec, BoolCodec


class Player_Online(AbstractPacket):
    id = 2041598093
    description = "Updates Player's Online Status"
    codecs = [BoolCodec, IntCodec, StringCodec]
    attributes = ['online', 'serverID', 'username']
    log = False