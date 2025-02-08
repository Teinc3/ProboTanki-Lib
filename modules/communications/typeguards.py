from typing import TypeGuard

from ...utils.enums import MessageType
from . import *


def is_log_message(message: AbstractMessage) -> TypeGuard['LogMessage']:
    return message.type == MessageType.LOG

def is_command_message(message: AbstractMessage) -> TypeGuard['CommandMessage']:
    return message.type == MessageType.COMMAND

def is_error_message(message: AbstractMessage) -> TypeGuard['ErrorMessage']:
    return message.type == MessageType.ERROR

__all__ = ['is_log_message', 'is_command_message', 'is_error_message']