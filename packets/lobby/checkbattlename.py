from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Check_Battle_Name(AbstractPacket):
    id = 566652736
    description = "Censors invalid battle names"
    codecs = [StringCodec]
    attributes = ['battleName']
