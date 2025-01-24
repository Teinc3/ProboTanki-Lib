from lib.codec.factory import VectorCodecFactory
from lib.codec.primitive import ByteCodec
from lib.packets import AbstractPacket


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
