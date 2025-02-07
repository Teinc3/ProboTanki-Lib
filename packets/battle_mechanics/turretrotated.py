from ...codec.complex import StringCodec
from ...codec.custom import TurretRotateCodec
from ...packets import AbstractPacket


class Turret_Rotated(AbstractPacket):
    id = 1927704181
    description = "Turret rotation data from server"
    attributes = ['username', 'turretRotation']
    codecs = [StringCodec, TurretRotateCodec]
    shouldLog = False
