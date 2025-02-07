from ...codec.complex import StringCodec
from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Update_Player_Team_Battle_Preview(AbstractPacket):
    id = -375282889
    description = "Updates a player's score in a team battle preview"
    codecs = [StringCodec, StringCodec, IntCodec]
    attributes = ['battleID', 'username', 'score']
    shouldLog = False
