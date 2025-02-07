from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Left_Selected_Preview(AbstractPacket):
    id = 1924874982
    description = 'A player has left the selected battle, from the preview screen'
    codecs = [StringCodec, StringCodec]
    attributes = ["battleID", "username"]
    shouldLog = False
