from packets.abstractpacket import AbstractPacket

from codec.primitive.intcodec import IntCodec
from codec.primitive.boolcodec import BoolCodec


class Login_Ready(AbstractPacket):
    id = -1277343167
    description = 'Server sends options for Login'
    codecs = [IntCodec, BoolCodec, IntCodec, IntCodec]
    attributes = ["bgResourceID", "requireEmail", "maxPWLen", "minPWLen"]