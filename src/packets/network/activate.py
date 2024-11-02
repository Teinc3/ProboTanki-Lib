from packets.abstractpacket import AbstractPacket
from codec.primitive import ByteCodec
from codec.complex import VectorCodecFactory


class Activate_Protection(AbstractPacket):
    id = 2001736388
    description = 'Contains the keys required to activate packet encryption'
    codecs = [VectorCodecFactory(int, ByteCodec)]
    attributes = ['keys']

    def process(self):
        super().process()
        self.protections.activate(self.object['keys'])
        self.logger.log_warning("Protection Activated")