from packets.abstractpacket import AbstractPacket

from codec.primitive import ShortCodec, IntCodec
from codec.custom.turretrotatecodec import TurretRotateCodec


class Rotate_Turret(AbstractPacket):
    id = -114968993
    description = "Turret rotation data from server"
    attributes = ['clientTime', 'turretRotation', "incarnationID"]
    codecs = [IntCodec, TurretRotateCodec, ShortCodec]