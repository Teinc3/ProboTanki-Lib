from ...packets import AbstractPacket
from ...codec.primitive import IntCodec
from ...codec.complex import Vector3DCodec
from ...codec.factory import VectorCodecFactory
from ...codec.custom import TargetPositionCodec


class Hammer_Shot_OUT(AbstractPacket):
    id = -541655881
    description = "Player fires a hammer shot"
    codecs = [IntCodec, Vector3DCodec, VectorCodecFactory(TargetPositionCodec, dict)]
    attributes = ['clientTime', 'direction', 'shots']


__all__ = ['Hammer_Shot_OUT']