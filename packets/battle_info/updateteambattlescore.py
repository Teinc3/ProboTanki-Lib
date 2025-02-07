from ...packets import AbstractPacket

from ...codec.primitive import IntCodec


class Update_Team_Battle_Score(AbstractPacket):
    id = 561771020
    description = "Update the score of a team within battle"
    attributes = "team, score"
    codecs = [IntCodec, IntCodec]