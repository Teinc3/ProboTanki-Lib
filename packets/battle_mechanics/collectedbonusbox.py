from ...codec.complex import StringCodec
from .. import AbstractPacket


class Collected_Bonus_Box(AbstractPacket):
    id = -1291499147
    description = "A bonus box was picked up"
    attributes = ['bonusId']
    codecs = [StringCodec]


__all__ = ['Collected_Bonus_Box']