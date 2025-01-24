from lib.codec.complex import StringCodec
from lib.packets import AbstractPacket


class Load_Map_Lights(AbstractPacket):
    id = -152638117
    description = "Load Map Lights"
    attributes = ['json']
    codecs = [StringCodec]
