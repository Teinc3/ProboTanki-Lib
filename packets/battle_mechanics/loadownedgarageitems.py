from ...codec.complex import JsonCodec
from ...packets import AbstractPacket


class Load_Owned_Garage_Items(AbstractPacket):
    id = -255516505
    description = "Load Owned Garage Items"
    attributes = ['json']
    codecs = [JsonCodec]
