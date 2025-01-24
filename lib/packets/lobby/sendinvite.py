from lib.codec.complex import StringCodec
from lib.packets.abstractpacket import AbstractPacket


class Send_Invite(AbstractPacket):
    id = -864265623
    description = "Send a battle invite to a player"
    attributes = ['username', 'battleID']
    codecs = [StringCodec, StringCodec]
