from ...codec.complex import DoubleIntCodecFactory
from ...packets import AbstractPacket


class Battle_Ping_Sync(AbstractPacket):
    id = 2074243318
    description = "Attempts to sync ping information with the server"
    codecs = [DoubleIntCodecFactory("clientTime", "serverSessionTime")]
    attributes = ["latencyInfo"]
    shouldLog = False
