import time
from abc import ABC, abstractmethod
from threading import Event
from typing import ClassVar

from lib.modules import TankiSocket, Protection, AbstractProcessor


class ReconnectionConfig:
    """
    Configuration for reconnection settings.
    
    Attributes:
        - MAX_RECONNECTIONS (int): Maximum number of reconnections needed to trigger socket break. 
            Non-Positives: Socket will infinitely reconnect and not break. 0+: Number of reconnections.
        - RECONNECTION_INTERVAL (float): The maximum number of reconnections has to be reached within this interval before socket break.
            Negatives: Accumulative over time. 0+: Accumulative over time in SECONDS.
        - BREAK_INTERVAL (float): Time of socket break before reconnecting.
            Negatives: Permanent break. 0+: Break for this time in minutes.
    """
    def __init__(self, max_reconnections: int = 3, reconnection_interval: float = 60, break_interval: float = 5):
        self.MAX_RECONNECTIONS = max_reconnections
        self.RECONNECTION_INTERVAL = reconnection_interval
        self.BREAK_INTERVAL = break_interval


class TankiInstance(ABC):
    RECONNECTION_CONFIG: ClassVar[ReconnectionConfig]

    processor: AbstractProcessor
    tankisocket: TankiSocket

    def __init__(self, id: int, credentials: dict, reconnections: list[float] = []):
        self.id = id # Just for identification/debugging purposes
        self.credentials = credentials

        self.reconnections = reconnections
        self.protection = Protection()
        self.emergency_halt = Event()
        
        self.instantiate_processor()
        self.instantiate_socket()

    @abstractmethod
    def instantiate_processor(self):
        """
        Instantiate the processor for the TankiInstance.
        As different types of instances will need different processors, this method is abstract.
        """
        return NotImplementedError()

    def instantiate_socket(self):
        self.tankisocket = TankiSocket(self.protection, self.credentials.get('proxy', None), self.emergency_halt, self.processor.parse_packets, self.on_socket_close)
        self.processor.socketinstance = self.tankisocket

    def on_socket_close(self, e: Exception):
        # Log the exception
        print(f"Socket {self.id} closed: {e}")
        
        # Cleanup the existing socket
        self.emergency_halt.set()
        self.tankisocket.socket.close()

        # Break for a certain interval before reconnecting (or if negative, do not reconnect)
        break_interval = self.check_reconnection()
        if break_interval < 0:
            return
        
        if break_interval > 0:
            print(f"Socket {self.id} will reconnect in {break_interval} minutes.")
        else:
            break_interval += 1 / 60 # Add 1 second to the break interval to prevent instant reconnect
        time.sleep(break_interval * 60)
        
        # Create a new Instance of TankiSocket with the same credentials.
        self.__init__(self.id, self.credentials, self.reconnections)

    def check_reconnection(self) -> float:
        """
        Check if the socket should be reconnected, and if so, the number of minutes to wait before reconnecting (ie. break interval).

        Returns:
            float: Number of minutes to wait before reconnecting. 0 means no wait. Negative value means no reconnect.
        """
        current_time = time.time()
        self.reconnections.append(current_time)

        if self.RECONNECTION_CONFIG.RECONNECTION_INTERVAL > 0:
            # Remove reconnections that are older than the reconnection interval
            self.reconnections = list(filter(lambda x: x > current_time - self.RECONNECTION_CONFIG.RECONNECTION_INTERVAL, self.reconnections))

        if self.RECONNECTION_CONFIG.MAX_RECONNECTIONS <= 0:
            return 0
        
        if len(self.reconnections) >= self.RECONNECTION_CONFIG.MAX_RECONNECTIONS:
            break_interval = self.RECONNECTION_CONFIG.BREAK_INTERVAL
            if break_interval >= 0:
                return break_interval
            else: 
                return -1
            
        # No break interval, instant reconnect
        return 0