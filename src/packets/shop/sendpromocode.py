from packets.abstractpacket import AbstractPacket

from codec.complex import StringCodec


class Send_Promocode(AbstractPacket):
    id = -511004908
    description = 'Client uses a promocode'
    codecs = [StringCodec]
    attributes = ['promocode']