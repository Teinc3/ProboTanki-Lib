from packets.abstractpacket import AbstractPacket

from codec.complex import StringCodec


class Remove_Battle(AbstractPacket):
    id = -1848001147
    description = "Removes a battle from the lobby"
    attributes = ['battleID']
    codecs = [StringCodec]