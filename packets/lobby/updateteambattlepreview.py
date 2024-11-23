from lib.codec.complex import StringCodec
from lib.codec.primitive import IntCodec
from lib.packets.abstractpacket import AbstractPacket


class Update_Team_Battle_Preview(AbstractPacket):
    id = 1428217189
    description = "Updates a team's score in the battle preview"
    codecs = [StringCodec, IntCodec, IntCodec]
    attributes = ['battleID', 'team', 'score']
    shouldLog = False
