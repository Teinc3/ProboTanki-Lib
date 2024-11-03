from codec.complex import StringCodec
from packets.abstractpacket import AbstractPacket


class Left_Battle(AbstractPacket):
    id = 1924874982
    description = 'A player has left a battle'
    codecs = [StringCodec, StringCodec]
    attributes = ["battleID", "username"]
    shouldLog = False
