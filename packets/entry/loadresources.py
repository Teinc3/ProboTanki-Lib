from lib.codec.complex import JsonCodec
from lib.codec.primitive import IntCodec
from lib.packets import AbstractPacket


class Load_Resources(AbstractPacket):
    id = -1797047325
    description = 'Server tells us what resources to load'
    codecs = [JsonCodec, IntCodec]
    attributes = ['json', "callbackID"]
    shouldLog = False
