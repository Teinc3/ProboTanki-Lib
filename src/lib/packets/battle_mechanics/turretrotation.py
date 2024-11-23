from lib.codec.custom import TurretRotateCodec
from lib.codec.primitive import ShortCodec, IntCodec
from lib.packets.abstractpacket import AbstractPacket


class Turret_Rotation(AbstractPacket):
    id = -114968993
    description = "Sends current turret rotation data to the server"
    attributes = ['clientTime', 'turretRotation', "incarnationID"]
    codecs = [IntCodec, TurretRotateCodec, ShortCodec]
    shouldLog = False
