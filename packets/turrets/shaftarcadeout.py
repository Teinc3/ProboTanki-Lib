from lib.codec.complex import Vector3DCodec, VectorVector3DCodec, VectorStringCodec, VectorShortCodec
from lib.codec.primitive import IntCodec
from lib.packets import AbstractPacket


class Shaft_Arcade_OUT(AbstractPacket):
    id = -2030760866
    description = "Sends server details about a released Shaft arcade shot"
    attributes = ['time', 'staticHitPoint', 'targets', 'targetHitPoints', "incarnationIDs", "targetBodyPositions",
                  "globalHitPoints"]
    codecs = [IntCodec, Vector3DCodec, VectorStringCodec, VectorVector3DCodec, VectorShortCodec, VectorVector3DCodec,
              VectorVector3DCodec]