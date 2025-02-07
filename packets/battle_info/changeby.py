from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Change_By(AbstractPacket):
    id = -593513288
    description = "Change By"
    codecs = [IntCodec]
    attributes = ['changeBy']
