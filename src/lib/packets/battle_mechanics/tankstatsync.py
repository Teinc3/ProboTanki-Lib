from packets.abstractpacket import AbstractPacket

from codec.primitive import IntCodec, ShortCodec
from codec.custom.movecodec import MoveCodec


class Tank_Move_Info(AbstractPacket):
    id = -1683279062
    description = "Client moved passively"
    attributes = ["someRandomTime", "specificationID", "movement", "turretDirection"]
    codecs = [IntCodec, ShortCodec, MoveCodec, ShortCodec]