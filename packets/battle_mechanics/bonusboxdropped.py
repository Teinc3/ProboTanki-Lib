from ...codec.complex import Vector3DCodec, StringCodec
from ...codec.primitive import IntCodec
from ...packets import AbstractPacket

# from .collectbonusbox import Collect_Bonus_Box

class Bonus_Box_Dropped(AbstractPacket):
    id = 1831462385
    description = "A bonus box has dropped"
    codecs = [StringCodec, Vector3DCodec, IntCodec]
    attributes = ['bonusId', 'position', "fallTimeThreshold"]