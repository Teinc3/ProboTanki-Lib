from .autoenum import AutoEnum


class LogChannelType(AutoEnum):
    """To be extended by more channel types"""
    system = "System Logs"


__all__ = ['LogChannelType']