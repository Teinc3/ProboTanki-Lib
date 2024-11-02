from packets.abstractpacket import AbstractPacket

from codec.primitive import IntCodec
from codec.complex import StringCodec


class Update_Player_DM_Battle_Preview(AbstractPacket):
    id = -1263036614
    description = "Updates a player's kills in a DM battle preview"
    codecs = [StringCodec, StringCodec, IntCodec]
    attributes = ['battleID', 'username', 'kills']
    shouldLog = False