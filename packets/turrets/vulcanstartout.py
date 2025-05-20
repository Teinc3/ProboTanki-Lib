from ...packets import AbstractPacket
from ...codec.primitive import IntCodec


class Vulcan_Start_OUT(AbstractPacket):
    id = -520655432
    description = "Vulcan starts shooting"
    codecs = [IntCodec]
    attributes = ["clientTime"]


__all__ = ["Vulcan_Start_OUT"]