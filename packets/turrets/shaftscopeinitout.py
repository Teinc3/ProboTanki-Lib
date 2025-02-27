from ...packets import AbstractPacket

from ...codec.primitive import IntCodec


class Shaft_Scope_Init_OUT(AbstractPacket):
    id = -367760678
    description = "Initiates a shaft scope shot"
    attributes = ['clientTime']
    codecs = [IntCodec]


__all__ = ['Shaft_Scope_Init_OUT']