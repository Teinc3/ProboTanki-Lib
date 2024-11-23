from lib.codec.complex import StringCodec
from lib.packets import AbstractPacket


class Fully_Respawned(AbstractPacket):
    id = 1868573511
    description = "Packet sent when the player has fully respawned"
    attributes = ["tankId"]
    codecs = [StringCodec]
