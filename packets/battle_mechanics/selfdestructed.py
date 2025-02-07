from ...codec.complex import StringCodec
from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Self_Destructed(AbstractPacket):
    id = 162656882
    description = "Information about a self destructed tank"
    attributes = ["username", "respDelay"]
    codecs = [StringCodec, IntCodec]
