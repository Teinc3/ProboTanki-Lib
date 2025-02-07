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
