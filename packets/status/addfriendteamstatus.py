from lib.codec.complex import StringCodec
from lib.codec.primitive import IntCodec
from lib.packets.abstractpacket import AbstractPacket


class Add_Friends_Team_Status(AbstractPacket):
    id = -169305322
    description = "Add this player to the friends count in Team status"
    attributes = ['battleID', 'username', 'team']
    codecs = [StringCodec, StringCodec, IntCodec]
    shouldLog = False
