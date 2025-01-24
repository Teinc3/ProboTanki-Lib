from lib.codec.complex import StringCodec
from lib.packets.abstractpacket import AbstractPacket


class Round_Finish(AbstractPacket):
    id = 1534651002
    description = "The existing battle round has finished"
    attributes = ['battleID']
    codecs = [StringCodec]
