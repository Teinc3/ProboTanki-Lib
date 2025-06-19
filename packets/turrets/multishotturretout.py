from .. import AbstractPacket
from ...codec.primitive import IntCodec
from ...codec.complex import Vector3DCodec
from ...codec.custom import TargetPositionCodec
from ...codec.factory import VectorCodecFactory


class Multi_Shot_Turret_OUT(AbstractPacket):
    id = -1889502569
    description = "Outgoing shot fired by a multi-shot turret"
    codecs = [IntCodec, Vector3DCodec, VectorCodecFactory(dict, TargetPositionCodec, False)]
    attributes = ['clientTime', 'direction', 'targetHits']


__all__ = ['Multi_Shot_Turret_OUT']