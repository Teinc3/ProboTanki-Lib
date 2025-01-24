from lib.codec.primitive import FloatCodec, IntCodec
from lib.packets.abstractpacket import AbstractPacket


class Load_Rating_Stats(AbstractPacket):
    id = -1128606444
    description = 'Player Rating stats'
    codecs = [FloatCodec, IntCodec]
    attributes = ["rating", "place"]
