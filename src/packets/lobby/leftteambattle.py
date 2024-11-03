from packets.abstractpacket import AbstractPacket

from codec.complex import StringCodec


class Left_Team_Battle(AbstractPacket):
    id = 1447204641
    description = 'A player has left a DM battle'
    codecs = [StringCodec, StringCodec]
    attributes = ["battleID", "username"]
    shouldLog = False