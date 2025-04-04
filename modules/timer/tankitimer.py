import time


class TankiTimer:
    """Thread-safe timer for client time tracking"""
    
    def __init__(self):
        self._client_time: int = 0
        self._last_timestamp: int = int(time.time() * 1000)
        self._last_returned_time: int = 0  # Global monotonic counter
        self._last_physics_time: int = 0   # Track last physics time separately
        
    @property
    def client_time(self):
        """Get current client time with thread-safe updates"""

        current_timestamp = int(time.time() * 1000)
        elapsed_time = current_timestamp - self._last_timestamp
        
        # Update client time based on elapsed time
        self._client_time += elapsed_time
        self._last_timestamp = current_timestamp
        
        # Ensure monotonicity against global counter (only if going backward)
        if self._client_time < self._last_returned_time:
            self._client_time = self._last_returned_time
        
        # Update global counter
        self._last_returned_time = self._client_time
        return self._client_time
        
    @client_time.setter
    def client_time(self, value):
        """Thread-safe setting of client time"""

        # Allow setting time to a future or equal value
        if value < self._last_returned_time:
            return
        
        self._client_time = value
        self._last_timestamp = int(time.time() * 1000)
        self._last_returned_time = value
        # Also update physics time if needed
        if value >= self._last_physics_time:
            self._last_physics_time = value
    
    def ping_time(self):
        """Get time for battle ping responses that respects monotonicity"""

        # Use regular client time for ping responses
        time_value = self.client_time
        return time_value
    
    @property
    def physics_time(self):
        """Get time with consistent 33ms intervals between calls"""

        # Get current client time (updates internal state)
        time_value = self.client_time
        
        # Calculate next physics time based on 33ms increments from last physics time
        if self._last_physics_time == 0:
            # First physics update - just use current time
            result = time_value
        else:
            # Subsequent updates - maintain exact 33ms intervals
            time_diff = time_value - self._last_physics_time
            steps = max(1, (time_diff + 16) // 33)  # Always at least 1 step, better rounding
            old_result = self._last_physics_time + (steps * 33)
            result = old_result
        
        # Simple monotonicity check - just ensure we don't go backward
        if result < self._last_returned_time:
            while result < self._last_returned_time:
                result += 33
        
        # Update time counters
        self._last_physics_time = result
        self._last_returned_time = result
        
        return result
        
    @physics_time.setter
    def physics_time(self, value):
        """Allows the user to set the physics time manually, but validates against existing values"""

        # Ensure value is a multiple of 33ms from the last physics time
        remainder = (value - self._last_physics_time) % 33
        if remainder != 0:
            raise ValueError(f"Physics time must be a multiple of 33ms: {remainder} != 0")
            
        # Ensure monotonicity against global counter
        if value < self._last_returned_time:
            raise ValueError(f"Physics time cannot go backward: {value} < {self._last_returned_time}")
        
        # Update physics time and global counter
        self._last_physics_time = value
        self._last_returned_time = value
    
    def reset(self):
        """Resets timer"""

        self._client_time = 0
        self._last_timestamp = int(time.time() * 1000)
        self._last_returned_time = 0
        self._last_physics_time = 0


__all__ = ['TankiTimer']