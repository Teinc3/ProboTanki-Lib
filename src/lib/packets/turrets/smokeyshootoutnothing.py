from lib.packets.abstractpacket import AbstractPacket
from lib.codec.primitive import IntCodec


class Smokey_Shot_OUT_NOTHING(AbstractPacket):
    id = 1478921140
    description = "Smokey Shoot out NOTHING"
    attributes = ["clientTime"]
    codecs = [IntCodec]
