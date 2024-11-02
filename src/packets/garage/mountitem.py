from packets.abstractpacket import AbstractPacket

from codec.complex import StringCodec


class Mount_Item(AbstractPacket):
    id = -1505530736
    description = "Mount an item in garage"
    attributes = ['item_id']
    codecs = [StringCodec]