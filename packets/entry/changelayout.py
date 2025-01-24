from lib.packets import AbstractPacket

from lib.codec.primitive import IntCodec


class Change_Layout(AbstractPacket):
    id = 1118835050
    description = 'Changes client layout/mode'
    attributes = ['layout']
    codecs = [IntCodec]