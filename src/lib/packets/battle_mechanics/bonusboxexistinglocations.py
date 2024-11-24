from lib.packets.abstractpacket import AbstractPacket
from lib.codec.complex import JsonCodec

# from lib.packets.battle_mechanics.collectcrystalbox import Collect_Crystal_Box


class Bonus_Box_Existing_Locations(AbstractPacket):
    id = 870278784
    description = "Locations of existing bonus boxes"
    codecs = [JsonCodec]
    attributes = ['json']
