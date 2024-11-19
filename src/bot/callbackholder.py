import socket as Socket
from typing import Callable

from lib.modules.protection import Protection
from enums import ProcessorCodes, ProcessorIDs

class CallbackHolder:
    def __init__(
        self, 
        protection: Protection, 
        socket: Socket.socket, 
        storage: dict, 
        close_socket: Callable[[ProcessorCodes], None],
        swap_processor: Callable[[ProcessorIDs], None],
        watchdog: bool
    ):
        
        self.protection = protection
        self.socket = socket
        self.storage = storage
        self.close_socket = close_socket
        self.swap_processor = swap_processor
        self.watchdog = watchdog