from lib.codec.complex import StringCodec
from lib.codec.primitive import IntCodec
from lib.packets.abstractpacket import AbstractPacket


class Respawn_Delay(AbstractPacket):
    id = -173682854
    description = "Respawn Delay Packet"
    attributes = ['tank', 'respawnDelay']
    codecs = [StringCodec, IntCodec]
