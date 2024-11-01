from packets.abstractpacket import AbstractPacket

from codec.primitive import StringCodec, IntCodec


class Receive_Game_Chat(AbstractPacket):
    id = 1259981343
    description = "Receives a message from the game chat"
    codecs = [StringCodec, StringCodec, IntCodec]
    attributes = ['username', 'message', 'team']