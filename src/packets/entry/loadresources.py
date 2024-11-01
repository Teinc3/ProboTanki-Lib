from packets.abstractpacket import AbstractPacket
from codec.primitive.stringcodec import StringCodec
from codec.primitive.intcodec import IntCodec


class Load_Resources(AbstractPacket):
    id = -1797047325
    description = 'Server tells us what resources to load'
    codecs = [StringCodec, IntCodec]
    attributes = ["json", "callbackID"]