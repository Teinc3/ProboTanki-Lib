from packets.abstractpacket import AbstractPacket

from codec.primitive import IntCodec
from codec.complex import StringCodec


class Premium_Notifier(AbstractPacket):
    id = -2069508071
    description = "Updates a player's premium status"
    codecs = [IntCodec, StringCodec]
    attributes = ['timeLeft', 'username']