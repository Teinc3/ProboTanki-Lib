from lib.codec.primitive import IntCodec
from lib.packets.abstractpacket import AbstractPacket


class Supply_Box_Drop_Bonus_id(AbstractPacket):
    id = -2026749922
    description = "Supply box bonus id"
    codecs = [IntCodec]
    attributes = ['bonusId']
