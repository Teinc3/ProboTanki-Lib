from lib.codec.primitive import IntCodec
from lib.packets.abstractpacket import AbstractPacket


class Change_Mission(AbstractPacket):
    id = 1642608662
    description = "Change mission"
    codecs = [IntCodec]
    attributes = ['missionId']
