from packets import AbstractPacket

from codec.primitive import ByteCodec, IntCodec
from codec.factory import VectorCodecFactory

from PIL import Image
from io import BytesIO


class Receive_Captcha(AbstractPacket):
    id = -1670408519
    description = "Received a captcha image with its type"
    attributes = ["type", "imagedata"]
    codecs = [IntCodec, VectorCodecFactory(int, ByteCodec)]

    shouldLog = False

    def process(self):
        # Save the image to a file
        image = Image.open(BytesIO(bytes([(b+256) if b < 0 else b for b in self.object["imagedata"]])))
        image.save(f"captcha.png")
        super().process()