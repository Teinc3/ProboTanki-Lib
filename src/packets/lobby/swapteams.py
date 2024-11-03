from packets.abstractpacket import AbstractPacket

from codec.complex import StringCodec


class Swap_Teams(AbstractPacket):
    id = -994817471
    description = "Swaps teams in a battle"
    attributes = ['battleID']
    codecs = [StringCodec]