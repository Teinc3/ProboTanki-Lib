from ...packets import AbstractPacket

from ...codec.complex import StringCodec


class Check_Name_Availability(AbstractPacket):
    id = 1083705823
    description = "Check if a name is up for registration"
    attributes = ["username"]
    codecs = [StringCodec]