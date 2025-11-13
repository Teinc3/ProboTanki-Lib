from ...codec.primitive import LongCodec
from ...codec.factory import MultiTypeCodecFactory
from ...codec.custom import FlagInfoCodec
from ...packets import AbstractPacket


class Flags_Info(AbstractPacket):
    id = 789790814
    description = "Retrieve information about flagpoles of the current map"
    attributes = [
        "blueflag", "blueflag_sprite", "blueflag_pedestal_model",
        "redflag", "redflag_sprite", "redflag_pedestal_model",
        "flag_sfx"
    ]
    codecs = [
        FlagInfoCodec, LongCodec, LongCodec,
        FlagInfoCodec, LongCodec, LongCodec,
        MultiTypeCodecFactory(['sfx1', 'sfx2', 'sfx3', 'sfx4'], LongCodec)
    ]


__all__ = ['Flags_Info']
