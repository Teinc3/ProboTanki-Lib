from lib.codec.primitive import FloatCodec, IntCodec
from lib.packets.abstractpacket import AbstractPacket


class Player_Battle_Stats(AbstractPacket):
    id = -1128606444
    description = 'Player Battle stats'
    codecs = [FloatCodec, IntCodec]
    attributes = ["rating", "place"]
