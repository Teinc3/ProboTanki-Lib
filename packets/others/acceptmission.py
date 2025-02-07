from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Accept_Mission(AbstractPacket):
    id = -867767128
    description = "Accept mission"
    codecs = [IntCodec]
    attributes = ['missionId']
