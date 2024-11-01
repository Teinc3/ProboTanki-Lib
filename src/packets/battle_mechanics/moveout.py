from packets.abstractpacket import AbstractPacket

from codec.primitive import IntCodec, ShortCodec
from codec.custom.movecodec import MoveCodec


class Move_OUT(AbstractPacket):
    id = 329279865
    description = "Sends your movement data to the server"
    attributes = ['clientTime', 'specificationID', 'movement']
    codecs = [IntCodec, ShortCodec, MoveCodec]