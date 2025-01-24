from lib.codec.complex import StringCodec
from lib.packets.abstractpacket import AbstractPacket


class Load_Purchasable_Items(AbstractPacket):
    id = -300370823
    description = "Load Purchasable Items"
    attributes = ['json']
    codecs = [StringCodec]
