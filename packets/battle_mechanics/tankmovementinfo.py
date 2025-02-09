from ...codec.custom import MoveCodec
from ...codec.primitive import IntCodec, ShortCodec, FloatCodec
from ...packets import AbstractPacket


class Tank_Movement_Info(AbstractPacket):
    id = -1683279062
    description = "Client moved passively"
    attributes = ["clientTime", "specificationID", "movement", "turretDirection"]
    codecs = [IntCodec, ShortCodec, MoveCodec, FloatCodec]