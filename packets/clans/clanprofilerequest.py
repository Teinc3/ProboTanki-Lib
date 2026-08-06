from ...packets import AbstractPacket
from ...codec.complex import PascalStringCodec
from ...codec.primitive import IntCodec

class Clan_Profile_Request(AbstractPacket):
    id = 947733823
    description = 'Clan Profile Request'
    attributes = ['unknownInt0', 'tag']
    codecs = [IntCodec, PascalStringCodec]
