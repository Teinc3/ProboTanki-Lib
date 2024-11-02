from packets.abstractpacket import AbstractPacket

from codec.primitive import IntCodec


class Join_Battle(AbstractPacket):
    id = -1284211503
    description = 'Client requests to join the selected battle'
    codecs = [IntCodec]
    attributes = ["team"]
