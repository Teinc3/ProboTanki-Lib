from codec.complex import StringCodec
from packets.abstractpacket import AbstractPacket


class Subscribe_Status(AbstractPacket):
    id = 1774907609
    description = "Subscribe to status updates of a player."
    attributes = ['username']
    codecs = [StringCodec]
    shouldLog = False
