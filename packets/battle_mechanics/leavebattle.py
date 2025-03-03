from ...codec.primitive import IntCodec
from ...packets import AbstractPacket


class Leave_Battle(AbstractPacket):
    id = 377959142
    description = "Leaves battle to a layout (0 = Lobby, 1 = Garage)"
    attributes = ['layout']
    codecs = [IntCodec]


__all__ = ['Leave_Battle']