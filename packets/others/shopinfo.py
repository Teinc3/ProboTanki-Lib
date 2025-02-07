from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Shop_Info(AbstractPacket):
    id = 1863710730
    description = "Get shop info"
    codecs = [IntCodec]
    attributes = ['data']
