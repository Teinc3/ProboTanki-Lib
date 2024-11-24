from lib.codec.complex import StringCodec
from lib.packets.abstractpacket import AbstractPacket


class Collect_Crystal_Box(AbstractPacket):
    id = -1047185003
    description = "Collect a crystal box"
    codecs = [StringCodec]
    attributes = ['bonusId']

    def process(self):
        print(self.object)
        super().process()
        return False
