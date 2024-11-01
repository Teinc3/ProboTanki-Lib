from packets.abstractpacket import AbstractPacket

from codec.primitive.stringcodec import StringCodec


class Left_Battle(AbstractPacket):
    id = 1941694508
    description = 'A player has left the battle'
    codecs = [StringCodec]
    attributes = ["username"]
    log = False