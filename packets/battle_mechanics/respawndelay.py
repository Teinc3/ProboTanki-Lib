from ...codec.complex import StringCodec
from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Respawn_Delay(AbstractPacket):
    id = -173682854
    description = "Respawn Delay Packet"
    attributes = ['tank', 'respawnDelay']
    codecs = [StringCodec, IntCodec]
