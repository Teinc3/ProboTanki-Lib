from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Join_Battle(AbstractPacket):
    id = -1284211503
    description = 'Client requests to join the selected battle'
    codecs = [IntCodec]
    attributes = ["team"]
