from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Load_All_Battles(AbstractPacket):
    id = 552006706
    description = "Loads all current battles"
    attributes = ['battlesJson']
    codecs = [StringCodec]
