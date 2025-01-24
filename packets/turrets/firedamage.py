from lib.packets import AbstractPacket

from lib.codec.primitive import IntCodec
from lib.codec.complex import VectorVector3DCodec, VectorStringCodec, VectorShortCodec

class Fire_Damage(AbstractPacket):
    id = 1395251766
    description = "Firebird attack"
    attributes = ['clientTime', 'targets', 'incarnationIDs', 'targetBodyPositions', "targetHitPoints"]
    codecs = [IntCodec, VectorStringCodec, VectorShortCodec, VectorVector3DCodec, VectorVector3DCodec]