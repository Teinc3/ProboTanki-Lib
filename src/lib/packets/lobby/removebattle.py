from lib.codec.complex import StringCodec
from lib.packets.abstractpacket import AbstractPacket


class Remove_Battle(AbstractPacket):
    id = -1848001147
    description = "Removes a battle from the lobby"
    attributes = ['battleID']
    codecs = [StringCodec]
