from packets.abstractpacket import AbstractPacket

from codec.complex import StringCodec


class Select_Battle(AbstractPacket):
    id = 2092412133
    description = 'Client selects a battle / Server confirms selection of battle'
    codecs = [StringCodec]
    attributes = ['battleID']
