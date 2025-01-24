from lib.codec.complex import StringCodec
from lib.packets.abstractpacket import AbstractPacket


class Change_Location(AbstractPacket):
    id = 921004371
    description = "Buy from shop"
    codecs = [StringCodec]
    attributes = ['location_abbreviation']
