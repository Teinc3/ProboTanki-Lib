from lib.packets import AbstractPacket

from lib.codec.complex import StringCodec


class Set_Client_Lang(AbstractPacket):
    id = -1864333717
    description = "Sets client language"
    codecs = [StringCodec]
    attributes = ['lang']
