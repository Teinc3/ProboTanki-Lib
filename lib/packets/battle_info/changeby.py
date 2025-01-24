from lib.codec.primitive import IntCodec
from lib.packets.abstractpacket import AbstractPacket


class Change_By(AbstractPacket):
    id = -593513288
    description = "Change By"
    codecs = [IntCodec]
    attributes = ['changeBy']
