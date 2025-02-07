from ...codec.complex import StringCodec
from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Update_Player_DM_Battle_Preview(AbstractPacket):
    id = -1263036614
    description = "Updates a player's kills in a DM battle preview"
    codecs = [StringCodec, StringCodec, IntCodec]
    attributes = ['battleID', 'username', 'kills']
    shouldLog = False
