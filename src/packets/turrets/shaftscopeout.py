from packets.abstractpacket import AbstractPacket

from codec.primitive import ShortCodec, IntCodec, StringCodec
from codec.complex.vectorcodec import VectorCodecFactory
from codec.complex.vector3dcodec import Vector3DCodec

VectorCodecVector3D = VectorCodecFactory(Vector3DCodec)

class Shaft_Scope_OUT(AbstractPacket):
    id = 1632423559
    description = "Sends server details about a released Shaft scope shot"
    attributes = ['time', 'staticHitPoint', 'targets', 'targetHitPoints', "incarnationIDs", "targetBodyPositions", "unknown3DVectors"]
    codecs = [IntCodec, Vector3DCodec, VectorCodecFactory(StringCodec), VectorCodecVector3D, ShortCodec, VectorCodecVector3D, VectorCodecVector3D]