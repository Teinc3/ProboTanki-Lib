from .abstractmessage import AbstractMessage
from ...utils.enums import MessageType


class CommandMessage(AbstractMessage):
    """
    A message object that encompasses a command.

    Attributes:
    command -- The command to be executed
    """

    def __init__(self, command: str, payload: dict):
        self.command = command
        self.payload = payload

    @property
    def type(self):
        return MessageType.COMMAND