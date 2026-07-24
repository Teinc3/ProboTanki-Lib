from ...packets import AbstractPacket
from ...codec.custom import ClanElementCodec


class Clan_Info_In(AbstractPacket):


    id = -8296541
    description = "Your Clan Info"
    attributes = ['clan']
    codecs = [ClanElementCodec]
