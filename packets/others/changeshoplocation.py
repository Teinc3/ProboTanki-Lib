from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Buy_From_Shop(AbstractPacket):
    id = 880756819
    description = "Change location in shop"
    codecs = [StringCodec, StringCodec]
    attributes = ['itemId', 'itemType']
