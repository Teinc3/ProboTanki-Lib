from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Server_Restart(AbstractPacket):
    id = -1712113407
    description = "Indicates time (in seconds) until server restart"
    attributes = ['time']
    codecs = [IntCodec]
