from ...codec.complex import Vector3DCodec, StringCodec
from ...codec.primitive import IntCodec
from ...packets import AbstractPacket

# from .collectbonusbox import Collect_Bonus_Box

class Bonus_Box_Dropped(AbstractPacket):
    id = 1831462385
    description = "A bonus box has dropped"
    codecs = [StringCodec, Vector3DCodec, IntCodec]
    attributes = ['bonusId', 'position', "fallTimeThreshold"]

    # def process(self):
    #     # Check bonus box position: x between -4000 and -4200 and z between 1200 and 1500
    #     if -4300 < self.object['position']['x'] < -3900 and 900 < self.object['position']['z'] < 1500:
    #         print("Bonus box detected at", self.object['position'])
    #         # We will steal this bonus box immediately
    #         packet = Collect_Bonus_Box(True, False, self.protections, self.sockets)
    #         packet.object = {'bonusId': self.object['bonusId']}
    #         packet.deimplement()
    #         packet.sockets.server.send(packet.wrap())
    #         packet.process()
        
    #     super().process()
    #     return False # Forward to the server
