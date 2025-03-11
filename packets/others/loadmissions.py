from ...packets import AbstractPacket


class Load_Missions(AbstractPacket):
    id = 1227293080
    description = "User requests to load their missions"


__all__ = ['Load_Missions']