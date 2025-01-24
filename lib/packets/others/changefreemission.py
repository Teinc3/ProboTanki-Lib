from lib.codec.primitive import IntCodec
from lib.packets.abstractpacket import AbstractPacket


class Change_Free_Mission(AbstractPacket):
    id = 326032325
    description = "Change free mission"
    codecs = [IntCodec]
    attributes = ['missionId']
