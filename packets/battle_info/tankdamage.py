from lib.codec.custom import TankDamageCodec
from lib.codec.factory import VectorCodecFactory
from lib.packets import AbstractPacket


class Tank_Damage(AbstractPacket):
    id = -1165230470
    description = "Damage dealt to a tank"
    codecs = [VectorCodecFactory(dict, TankDamageCodec)]
    attributes = ['damages']
