from packets.abstractpacket import AbstractPacket

from codec.primitive import StringCodec, IntCodec


class Update_Preview_Battle_Player_Score(AbstractPacket):
    id = -375282889
    description = "Updates a player's score in the battle preview"
    codecs = [StringCodec, StringCodec, IntCodec]
    attributes = ['battleID', 'username', 'score']
    log = False