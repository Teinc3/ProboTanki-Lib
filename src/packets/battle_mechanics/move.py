from codec.custom.movecodec import MoveCodec
from codec.primitive import IntCodec, ShortCodec
from packets.abstractpacket import AbstractPacket


class Move(AbstractPacket):
    id = 329279865
    description = "Sends your movement data to the server"
    attributes = ['clientTime', 'specificationID', 'movement']
    codecs = [IntCodec, ShortCodec, MoveCodec]
