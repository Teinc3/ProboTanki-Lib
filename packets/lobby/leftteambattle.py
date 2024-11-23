from lib.codec.complex import StringCodec
from lib.packets.abstractpacket import AbstractPacket


class Left_Team_Battle(AbstractPacket):
    id = 1447204641
    description = 'A player has left a DM battle'
    codecs = [StringCodec, StringCodec]
    attributes = ["battleID", "username"]
    shouldLog = False
