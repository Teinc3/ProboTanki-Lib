from packets.abstractpacket import AbstractPacket

from codec.primitive import IntCodec
from codec.complex import StringCodec


class Self_Destructed(AbstractPacket):
    id = 162656882
    description = "Information about a self destructed tank"
    attributes = ["username", "respDelay"]
    codecs = [StringCodec, IntCodec]