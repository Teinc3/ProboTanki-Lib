from ...packets import AbstractPacket
from ...codec.custom import ClanProfileCodec


class Clan_Profile_In(AbstractPacket):

    id = -1855118498
    description = 'Clan Profile'
    attributes = ['clan']
    codecs = [ClanProfileCodec]
