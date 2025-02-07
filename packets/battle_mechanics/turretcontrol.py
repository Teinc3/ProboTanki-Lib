from ...codec.primitive import ByteCodec, ShortCodec, IntCodec
from ...packets import AbstractPacket


class Turret_Control(AbstractPacket):
    id = -1749108178
    description = "Turret Control Packet"
    attributes = ['clientTime', 'specificationID', 'control']
    codecs = [IntCodec, ShortCodec, ByteCodec]