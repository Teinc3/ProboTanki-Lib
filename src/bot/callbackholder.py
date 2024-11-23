from threading import Lock
from typing import Callable

import socks
from pyee import EventEmitter

from enums import ProcessorCodes, ProcessorIDs
from lib.modules.protection import Protection


class CallbackHolder:
    def __init__(
            self,
            protection: Protection = None,
            socket: socks.socksocket = None,
            storage: dict = None,
            close_socket: Callable[[ProcessorCodes], None] = None,
            swap_processor: Callable[[ProcessorIDs], None] = None,
            event_emitter: EventEmitter = None,
            watchdog: bool = False
    ):
        # Avoid mutable default arguments
        if storage is None:
            storage = {}

        # Initialize the global lock without invoking __setattr__
        object.__setattr__(self, '_lock', Lock())

        # Initialize other attributes using __setattr__ to ensure thread safety
        self.protection = protection
        self.storage = storage
        self.socket = socket
        self.close_socket = close_socket
        self.swap_processor = swap_processor
        self.event_emitter = event_emitter
        self.watchdog = watchdog

    def __setattr__(self, name, value):
        if name == '_lock':
            # Directly set the internal '_lock' attribute without locking
            object.__setattr__(self, name, value)
        else:
            # Acquire the lock before setting any other attribute
            with self._lock:
                object.__setattr__(self, name, value)

    def __getattr__(self, name):
        # This method is only called if normal attribute access fails
        # To avoid recursion, use object.__getattribute__ directly
        with self._lock:
            return object.__getattribute__(self, name)
