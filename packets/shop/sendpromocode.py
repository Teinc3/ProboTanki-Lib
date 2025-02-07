from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Send_Promocode(AbstractPacket):
    id = -511004908
    description = 'Client uses a promocode'
    codecs = [StringCodec]
    attributes = ['promocode']
