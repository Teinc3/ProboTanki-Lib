from ...codec.complex import StringCodec
from ...codec.primitive import ByteCodec
from ...packets import AbstractPacket


class Battle_User_Control(AbstractPacket):
    id = -301298508
    description = "Battle user control packet"
    codecs = [StringCodec, ByteCodec]
    attributes = ['tankiId', 'control']
