from ...codec.primitive import BoolCodec
from ...packets import AbstractPacket


class Close_Settings(AbstractPacket):
    id = -731115522
    description = "Close settings modal"
    codecs = [BoolCodec]
    attributes = ['close_state']
