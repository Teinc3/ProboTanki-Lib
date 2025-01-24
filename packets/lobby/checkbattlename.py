from lib.codec.complex import StringCodec
from lib.packets import AbstractPacket


class Check_Battle_Name(AbstractPacket):
    id = 566652736
    description = "Censors invalid battle names"
    codecs = [StringCodec]
    attributes = ['battleName']
