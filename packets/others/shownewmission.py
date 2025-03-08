from ...packets import AbstractPacket
from ...codec.primitive import IntCodec
from ...codec.custom import MissionCodec


class Show_New_Mission(AbstractPacket):
    id = -1266665816
    description = "Show the new mission that was previously changed"
    codecs = [IntCodec, MissionCodec]
    attributes = ['missionId', 'mission']


__all__ = ['Show_New_Mission']