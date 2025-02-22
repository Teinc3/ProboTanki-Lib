from .abstractmessage import AbstractMessage
from ...utils.enums import MessageType, LogChannelType


class LogMessage(AbstractMessage):
    """
    A message object that contains text/embed payloads to be logged to corresponding Discord channels.

    Attributes:
    - channel_type: LogChannelType
    - text: Optional[str]
    - payload: Optional[dict]
    """
    @property
    def type(self):
        return MessageType.LOG
    
    def __init__(self, channel_type: LogChannelType = LogChannelType.system, text: str = None, payload: dict = None):
        self.channel_type = channel_type
        self.text = text
        self.payload = payload