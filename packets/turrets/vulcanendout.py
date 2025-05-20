from ...packets import AbstractPacket
from ...codec.primitive import IntCodec


class Vulcan_End_OUT(AbstractPacket):
    id = 1794372798
    description = "Vulcan stops shooting"
    codecs = [IntCodec]
    attributes = ["clientTime"]


__all__ = ["Vulcan_End_OUT"]