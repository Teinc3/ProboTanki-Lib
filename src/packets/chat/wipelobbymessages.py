from packets.abstractpacket import AbstractPacket

from codec.primitive import StringCodec


class Wipe_Lobby_Messages(AbstractPacket):
    id = 1993050216
    description = "Wipes all messages by a user in the lobby"
    codecs = [StringCodec]
    attributes = ['username']