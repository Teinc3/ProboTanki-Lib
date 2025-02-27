from ...codec.complex import Vector3DCodec, VectorVector3DCodec, VectorStringCodec, VectorShortCodec
from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Shaft_Scope_OUT(AbstractPacket):
    id = 1632423559
    description = "Sends server details about a released Shaft scope shot"
    attributes = ['clientTime', 'staticHitPoint', 'targets', 'targetHitPoints', "incarnationIDs", "targetBodyPositions",
                  "globalHitPoints"]
    codecs = [IntCodec, Vector3DCodec, VectorStringCodec, VectorVector3DCodec, VectorShortCodec, VectorVector3DCodec,
              VectorVector3DCodec]
