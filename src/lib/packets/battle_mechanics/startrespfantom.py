from packets.abstractpacket import AbstractPacket

from codec.primitive import ShortCodec, IntCodec
from codec.complex import StringCodec, Vector3DCodec


class Start_Resp_Fantom(AbstractPacket):
    id = 875259457
    description = "Information about fantom status of a player"
    attributes = ["username", "team", "position", "orientation", "health", "incarnationID"]
    codecs = [StringCodec, IntCodec, Vector3DCodec, Vector3DCodec, ShortCodec, ShortCodec]
    