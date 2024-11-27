from lib.codec.complex import StringCodec
from lib.packets.abstractpacket import AbstractPacket


class Left_DM_Preview(AbstractPacket):
    id = 504016996
    description = 'A player has left a DM battle'
    codecs = [StringCodec, StringCodec]
    attributes = ["battleID", "username"]
    shouldLog = False
