from ...codec.factory import VectorCodecFactory
from ...codec.primitive import ByteCodec
from ...packets import AbstractPacket


class Activate_Protection(AbstractPacket):
    id = 2001736388
    description = 'Contains the keys required to activate packet encryption'
    codecs = [VectorCodecFactory(int, ByteCodec)]
    attributes = ['keys']

    def process(self):
        super().process()
        if self.proxy:
            self.protections.activate(self.object['keys'])
            return False
