from ...codec.complex import StringCodec
from ...packets import AbstractPacket


class Subscribe_Status(AbstractPacket):
    # _has_called = False
    id = 1774907609
    description = "Subscribe to status updates of a player."
    attributes = ['username']
    codecs = [StringCodec]
    shouldLog = False