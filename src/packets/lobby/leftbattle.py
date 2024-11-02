from packets.abstractpacket import AbstractPacket

from codec.complex import StringCodec


class Left_Battle(AbstractPacket):
    id = 504016996
    description = 'A player has left the battle'
    codecs = [StringCodec, StringCodec]
    attributes = ["battleID", "username"]
    shouldLog = False