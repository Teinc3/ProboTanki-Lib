from lib.codec.complex import Vector3DCodec, StringCodec
from lib.codec.primitive import IntCodec
from lib.packets.abstractpacket import AbstractPacket
from lib.packets.battle_mechanics.collectcrystalbox import Collect_Crystal_Box


class Crystal_Box_Drop_Location(AbstractPacket):
    id = 1831462385
    description = "A supply box has been dropped"
    codecs = [StringCodec, Vector3DCodec, IntCodec]
    attributes = ['bonusId', 'position', "fallTimeThreshold"]

    def process(self):
        if self.object['bonusId'].startswith('cry'):
            collect = Collect_Crystal_Box(proxy=True, direction=False, protections=self.protections,
                                          sockets=self.sockets)

            collect.objects = [self.object['bonusId']]
            collect.sockets.server.sendall(collect.wrap())
            print(collect.objects)

            super().process()
            return True
