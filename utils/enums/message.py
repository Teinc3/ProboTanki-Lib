from .autoenum import AutoEnum, auto


class MessageType(AutoEnum):
    LOG = auto(),
    COMMAND = auto(),
    INFO = auto(),
    ERROR = auto()