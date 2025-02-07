from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Select_Battle(AbstractPacket):
    id = 2092412133
    description = 'Client selects a battle / Server confirms selection of battle'
    codecs = [StringCodec]
    attributes = ['battleID']
