from abc import ABC
from typing import Generic, TypeVar

from .abstractmessage import AbstractMessage
from ...utils.enums import MessageType


TCommand = TypeVar('TCommand')
TPayload = TypeVar('TPayload')

class CommandMessage(AbstractMessage, Generic[TCommand, TPayload], ABC):
    """
    A message object that encompasses a command.

    Attributes:
    command: Generic[TCommand] - The command to be executed.
    payload: Generic[TPayload] - The payload to be passed to the command.

    Generic Types:
    TCommand - Datatype differentiating the command to be executed
    TPayload - Structure specifying the payload to be passed to the command
    """

    def __init__(self, command: TCommand, payload: TPayload):
        self.command = command
        self.payload = payload

    @property
    def type(self):
        return MessageType.COMMAND