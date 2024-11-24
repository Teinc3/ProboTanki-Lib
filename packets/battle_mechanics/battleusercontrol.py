from lib.codec.complex import StringCodec
from lib.codec.primitive import ByteCodec
from lib.packets.abstractpacket import AbstractPacket


class Battle_User_Control(AbstractPacket):
    id = -301298508
    description = "Battle user control packet"
    codecs = [StringCodec, ByteCodec]
    attributes = ['tankiId', 'control']
