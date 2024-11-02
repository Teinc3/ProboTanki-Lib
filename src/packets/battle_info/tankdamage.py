from packets.abstractpacket import AbstractPacket

from codec.factory import VectorCodecFactory
from codec.custom.tankdamagecodec import TankDamageCodec

class Tank_Damage(AbstractPacket):
    id = -1165230470
    description = "Damage dealt to a tank"
    codecs = [VectorCodecFactory(dict, TankDamageCodec)]
    attributes = ['damages']