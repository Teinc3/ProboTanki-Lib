from ...codec.primitive import FloatCodec, IntCodec
from ...packets import AbstractPacket


class Load_Rating_Stats(AbstractPacket):
    id = -1128606444
    description = 'Player Rating stats'
    codecs = [FloatCodec, IntCodec]
    attributes = ["rating", "place"]
