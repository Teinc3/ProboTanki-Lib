from packets.abstractpacket import AbstractPacket
from codec.primitive import IntCodec


class Resources_Loaded(AbstractPacket):
    id = -82304134
    description = 'Client callsback after finishes resource loading (NOT IMPLEMENTED)'
    codecs = [IntCodec]
    attributes = ["callbackId"]