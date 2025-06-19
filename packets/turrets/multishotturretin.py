from .. import AbstractPacket
from ...codec.complex import StringCodec, Vector3DCodec
from ...codec.custom import TargetHitCodec
from ...codec.factory import VectorCodecFactory


class Multi_Shot_Turret_IN(AbstractPacket):
    id = -891286317
    description = "Incoming shot fired by a multi-shot turret"
    codecs = [StringCodec, Vector3DCodec, VectorCodecFactory(dict, TargetHitCodec, False)]
    attributes = ['shooter', 'direction', 'targetHits']


__all__ = ['Multi_Shot_Turret_IN']