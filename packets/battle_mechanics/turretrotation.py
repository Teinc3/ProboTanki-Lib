from ...codec.custom import TurretRotateCodec
from ...codec.primitive import ShortCodec, IntCodec
from ...packets import AbstractPacket


class Turret_Rotation(AbstractPacket):
    id = -114968993
    description = "Sends current turret rotation data to the server"
    attributes = ['clientTime', 'turretRotation', "incarnationID"]
    codecs = [IntCodec, TurretRotateCodec, ShortCodec]
    shouldLog = False