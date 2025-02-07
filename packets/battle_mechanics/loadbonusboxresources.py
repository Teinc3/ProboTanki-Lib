from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Load_Bonus_Box_Resources(AbstractPacket):
    id = 228171466
    description = "Load Bonus Box Resources"
    attributes = ['json']
    codecs = [StringCodec]
