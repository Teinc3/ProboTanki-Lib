from codec.custom.turretrotatecodec import TurretRotateCodec
from codec.primitive import ShortCodec, IntCodec
from packets.abstractpacket import AbstractPacket


class Rotate_Turret(AbstractPacket):
    id = -114968993
    description = "Turret rotation data from server"
    attributes = ['clientTime', 'turretRotation', "incarnationID"]
    codecs = [IntCodec, TurretRotateCodec, ShortCodec]
