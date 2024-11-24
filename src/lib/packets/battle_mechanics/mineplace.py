from lib.codec.complex import StringCodec
from lib.packets.abstractpacket import AbstractPacket


class Mine_Place(AbstractPacket):
    id = -624217047
    description = "Sent when a mine is placed."
    attributes = ['mineId']
    codecs = [StringCodec]
