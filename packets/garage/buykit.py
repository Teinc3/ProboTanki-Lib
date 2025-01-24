from lib.packets import AbstractPacket

from lib.codec.primitive import IntCodec
from lib.codec.complex import StringCodec


class Buy_Kit(AbstractPacket):
    id = -523392052
    description = "Buy a kit"
    attributes = ["item_id", "base_cost"]
    codecs = [StringCodec, IntCodec]