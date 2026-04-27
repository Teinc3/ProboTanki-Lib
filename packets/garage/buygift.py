from .. import AbstractPacket
from ...codec.primitive import IntCodec
from ...codec.complex import StringCodec


class Buy_Gift(AbstractPacket):
    id = -1518850075
    description = "Buy a gift"
    attributes = ["target", "item_id", "message", "base_cost"]
    codecs = [StringCodec, StringCodec, StringCodec, IntCodec]

