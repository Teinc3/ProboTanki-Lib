from ...codec.complex import JsonCodec
from ...packets import AbstractPacket


class Load_Map_Info(AbstractPacket):
    id = -838186985
    description = 'Information about all maps the client should load'
    attributes = ['json']
    codecs = [JsonCodec]
    shouldLog = False
