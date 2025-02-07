from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class User_Supplies_info(AbstractPacket):
    id = -137249251
    description = "Load Bonus Box Resources"
    attributes = ['json']
    codecs = [StringCodec]
