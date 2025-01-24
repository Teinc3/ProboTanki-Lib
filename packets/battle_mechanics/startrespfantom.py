from lib.codec.complex import StringCodec, Vector3DCodec
from lib.codec.primitive import ShortCodec, IntCodec
from lib.packets import AbstractPacket


class Start_Resp_Fantom(AbstractPacket):
    id = 875259457
    description = "Information about fantom status of a player"
    attributes = ["username", "team", "position", "orientation", "health", "incarnationID"]
    codecs = [StringCodec, IntCodec, Vector3DCodec, Vector3DCodec, ShortCodec, ShortCodec]
