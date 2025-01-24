from lib.codec.complex import StringCodec
from lib.packets import AbstractPacket


class Despawn_Alive(AbstractPacket):
    id = 1719707347
    description = "Player despawns while alive"
    attributes = ['username']
    codecs = [StringCodec]
