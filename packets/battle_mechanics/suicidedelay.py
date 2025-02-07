from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Suicide_Delay(AbstractPacket):
    id = -911983090
    description = "Suicide delay packet"
    attributes = ["suicideDelayMS"]
    codecs = [IntCodec]
