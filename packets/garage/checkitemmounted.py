from lib.codec.complex import StringCodec
from lib.codec.primitive import BoolCodec
from lib.packets import AbstractPacket


class Check_Item_Mounted(AbstractPacket):
    id = 2062201643
    description = "If the mount was successful or not"
    attributes = ['item_id', 'mounted']
    codecs = [StringCodec, BoolCodec]
