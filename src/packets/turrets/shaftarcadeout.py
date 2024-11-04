from codec.complex import Vector3DCodec, VectorVector3DCodec, VectorStringCodec, VectorShortCodec
from codec.primitive import IntCodec
from packets.abstractpacket import AbstractPacket


class Shaft_Arcade_OUT(AbstractPacket):
    id = -2030760866
    description = "Sends server details about a released Shaft arcade shot"
    attributes = ['time', 'staticHitPoint', 'targets', 'targetHitPoints', "incarnationIDs", "targetBodyPositions",
                  "unknown3DVectors"]
    codecs = [IntCodec, Vector3DCodec, VectorStringCodec, VectorVector3DCodec, VectorShortCodec, VectorVector3DCodec,
              VectorVector3DCodec]
