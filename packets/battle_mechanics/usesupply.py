from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Use_Supply(AbstractPacket):
    id = -2102525054
    description = "Use a supply in the battle"
    attributes = ['supply_id']
    codecs = [StringCodec]


__all__ = ['Use_Supply']