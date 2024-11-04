from codec.complex import StringCodec
from codec.custom.turretrotatecodec import TurretRotateCodec
from packets.abstractpacket import AbstractPacket


class Rotated_Turret(AbstractPacket):
    id = 1927704181
    description = "Turret rotation data from server"
    attributes = ['username', 'turretRotation']
    codecs = [StringCodec, TurretRotateCodec]
