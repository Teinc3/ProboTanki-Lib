from ...packets import AbstractPacket
from ...codec.complex import JsonCodec


class Bonus_Box_Existing_Locations(AbstractPacket):
    id = 870278784
    description = "Locations of existing bonus boxes"
    codecs = [JsonCodec]
    attributes = ['json']
