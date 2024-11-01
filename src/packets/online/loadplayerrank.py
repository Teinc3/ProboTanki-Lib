from packets.abstractpacket import AbstractPacket

from codec.primitive import StringCodec, IntCodec


class Load_Player_Rank(AbstractPacket):
    id = -962759489
    description = "Loads the rank of a player"
    codecs = [IntCodec, StringCodec]
    attributes = ['rank', 'username']
    log = False