from packets.abstractpacket import AbstractPacket
from codec.complex import StringCodec
from codec.primitive import IntCodec


class Load_Resources(AbstractPacket):
    id = -1797047325
    description = 'Server tells us what resources to load'
    codecs = [StringCodec, IntCodec]
    attributes = ["json", "callbackID"]
    shouldLog = False
