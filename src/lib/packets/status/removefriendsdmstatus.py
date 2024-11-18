from codec.complex import StringCodec
from packets.abstractpacket import AbstractPacket


class Remove_Friends_DM_Status(AbstractPacket):
    id = -2133657895
    description = "Remove this player from the friends count in DM status"
    attributes = ['battleID', 'username']
    codecs = [StringCodec, StringCodec]
    shouldLog = False
