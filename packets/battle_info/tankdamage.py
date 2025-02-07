from ...codec.custom import TankDamageCodec
from ...codec.factory import VectorCodecFactory
from ...packets import AbstractPacket


class Tank_Damage(AbstractPacket):
    id = -1165230470
    description = "Damage dealt to a tank"
    codecs = [VectorCodecFactory(dict, TankDamageCodec)]
    attributes = ['damages']
