from dataclasses import dataclass

@dataclass
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
    MAX_RECONNECTIONS: int = 3
    RECONNECTION_INTERVAL: float = 60
    BREAK_INTERVAL: float = 5