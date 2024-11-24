from lib.codec.primitive import ByteCodec, ShortCodec, IntCodec
from lib.packets.abstractpacket import AbstractPacket


class Turret_Control(AbstractPacket):
    id = -1749108178
    description = "Turret Control Packet"
    attributes = ['userId', 'ShortCodec', 'control']
    codecs = [IntCodec, ShortCodec, ByteCodec]
