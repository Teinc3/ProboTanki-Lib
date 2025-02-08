from .abstractmessage import AbstractMessage
from ...utils.enums import MessageType


class ErrorMessage(AbstractMessage):
    """
    A message object that encompasses an error.

    Attributes:
    error -- The error object
    location -- The location where the error occurred
    state -- The state of the enclosing object where the error occurred
    """

    def __init__(self, error: Exception, location: str = None, state: str = None):
        self.error = error
        self.traceback_state = {}

        self.add_traceback_state(location, state)

    def add_traceback_state(self, location: str = None, state: str = None):
        if location is not None and state is not None:
            self.traceback_state[location] = state

    @property
    def type(self):
        return MessageType.ERROR