from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Mine_Place(AbstractPacket):
    id = -624217047
    description = "Sent when a mine is placed."
    attributes = ['mineId']
    codecs = [StringCodec]
