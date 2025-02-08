from abc import ABC, abstractmethod

from ...utils.enums import MessageType


class AbstractMessage(ABC):
    """ Base class for all communication messages between Tanki Processors and Discord/Webserver """

    @property
    @abstractmethod
    def type(self) -> MessageType:
        """ Returns the type of the message """
        raise NotImplementedError
