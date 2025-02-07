from ...codec.primitive.intcodec import IntCodec
from ...codec.complex.stringcodec import StringCodec
from ...packets import AbstractPacket


class Buy_Multiple_Items(AbstractPacket):
    id = -1961983005
    description = "Buy multiple items from garage, like supplies, xp boosts"
    attributes = ['item_id', 'count', 'base_cost']
    codecs = [StringCodec, IntCodec, IntCodec]
