from packets.abstractpacket import AbstractPacket

from codec.complex import StringCodec
from codec.custom.turretrotatecodec import TurretRotateCodec


class Rotate_Turret_IN(AbstractPacket):
    id = 1927704181
    description = "Turret rotation data from server"
    attributes = ['username', 'turretRotation']
    codecs = [StringCodec, TurretRotateCodec]
