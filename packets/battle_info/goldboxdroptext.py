from lib.packets import AbstractPacket

from lib.codec.primitive import IntCodec
from lib.codec.complex import StringCodec


class Gold_Box_Drop_Text(AbstractPacket):
    id = -666893269
    description = "Announces that a gold box will drop soon"
    attributes = ["text", "soundID"]
    codecs = [StringCodec, IntCodec]