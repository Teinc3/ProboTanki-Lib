from lib.codec.complex import StringCodec
from lib.packets.abstractpacket import AbstractPacket


class Remove_Friends_Team_Status(AbstractPacket):
    id = 1447204641
    description = "Remove this player from the friends count in team status"
    attributes = ['battleID', 'username']
    codecs = [StringCodec, StringCodec]
    shouldLog = False
