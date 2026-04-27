from ...codec.primitive import BoolCodec
from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Clan_Status(AbstractPacket):
    id = -117055417
    description = 'Clan status of the player'
    codecs = [BoolCodec, StringCodec, StringCodec]
    attributes = ["inClan", "clanTag", "username"]
    shouldLog = False
