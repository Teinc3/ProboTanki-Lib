from ...codec.complex import StringCodec
from .. import AbstractPacket


class Collect_Cry_Box(AbstractPacket):
    id = -1047185003
    description = "Collect a crystal box"
    codecs = [StringCodec]
    attributes = ['bonusId']


__all__ = ['Collect_Cry_Box']