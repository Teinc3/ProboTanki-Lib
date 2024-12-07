from lib.codec.custom import MoveCodec
from lib.codec.primitive import IntCodec, ShortCodec
from lib.packets.abstractpacket import AbstractPacket


class Tank_Movement_Info(AbstractPacket):
    id = -1683279062
    description = "Client moved passively"
    attributes = ["clientTime", "specificationID", "movement", "turretDirection"]
    codecs = [IntCodec, ShortCodec, MoveCodec, ShortCodec]