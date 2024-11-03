from packets.abstractpacket import AbstractPacket

from codec.complex import StringCodec


class Load_Map_Info(AbstractPacket):
    id = -838186985
    description = 'Information about all maps the client should load'
    attributes = ['json']
    codecs = [StringCodec]
    shouldLog = False