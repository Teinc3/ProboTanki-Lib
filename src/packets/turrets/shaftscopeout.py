from packets.abstractpacket import AbstractPacket

from codec.primitive import IntCodec
from codec.complex import Vector3DCodec, VectorVector3DCodec, VectorStringCodec, VectorShortCodec


class Shaft_Scope_OUT(AbstractPacket):
    id = 1632423559
    description = "Sends server details about a released Shaft scope shot"
    attributes = ['time', 'staticHitPoint', 'targets', 'targetHitPoints', "incarnationIDs", "targetBodyPositions",
                  "unknown3DVectors"]
    codecs = [IntCodec, Vector3DCodec, VectorStringCodec, VectorVector3DCodec, VectorShortCodec, VectorVector3DCodec,
              VectorVector3DCodec]
