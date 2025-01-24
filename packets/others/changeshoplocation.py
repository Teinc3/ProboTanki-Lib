from lib.codec.complex import StringCodec
from lib.packets import AbstractPacket


class Buy_From_Shop(AbstractPacket):
    id = 880756819
    description = "Change location in shop"
    codecs = [StringCodec, StringCodec]
    attributes = ['itemId', 'itemType']
