from codec.complex import StringCodec
from codec.primitive import BoolCodec
from packets.abstractpacket import AbstractPacket


class Item_Mounted(AbstractPacket):
    id = 2062201643
    description = "If the mount was successful or not"
    attributes = ['item_id', 'mounted']
    codecs = [StringCodec, BoolCodec]
