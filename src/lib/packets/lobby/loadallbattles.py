from packets.abstractpacket import AbstractPacket

from codec.complex import StringCodec


class Load_All_Battles(AbstractPacket):
    id = 552006706
    description = "Loads all current battles"
    attributes = ['battlesJson']
    codecs = [StringCodec]
    