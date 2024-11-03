from packets.abstractpacket import AbstractPacket

from codec.complex import StringCodec


class Remove_Friends_Team_Status(AbstractPacket):
    id = 1447204641
    description = "Remove this player from the friends count in team status"
    attributes = ['battleID', 'username']
    codecs = [StringCodec, StringCodec]
    shouldLog = False