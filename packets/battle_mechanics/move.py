from ...codec.custom import MoveCodec
from ...codec.primitive import IntCodec, ShortCodec
from ...packets import AbstractPacket


class Move(AbstractPacket):
    # last_client_time = 0
    # last_pos_z = 0

    id = 329279865
    description = "Sends your movement data to the server"
    attributes = ['clientTime', 'specificationID', 'movement']
    codecs = [IntCodec, ShortCodec, MoveCodec]