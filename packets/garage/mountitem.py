from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Mount_Item(AbstractPacket):
    id = -1505530736
    description = "Mount an item in garage"
    attributes = ['item_id']
    codecs = [StringCodec]
