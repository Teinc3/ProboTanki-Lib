class ATarget:
    """
    Async Target class for tracking player status.
    No lock needed as all access is coordinated by AsyncBaseTracker.
    """

    def __init__(self, name: str):
        self.name = name

        # Status properties
        self._online = False
        self._battleID = ''
        self._ignore_flag = False

        # Status tracking flags
        self.online_status_recv = False
        self.battle_status_recv = False
        self.tracked_first_time = False
        """Indicates if the target has been tracked for the first time."""
        

    @property
    def online(self):
        return self._online
    
    @online.setter
    def online(self, value):
        self._online = value
        self.online_status_recv = True

    @property
    def battleID(self):
        return self._battleID
    
    @battleID.setter
    def battleID(self, value):
        self._battleID = value
        self.battle_status_recv = True

    @property
    def rank(self):
        return self._rank
    
    @rank.setter
    def rank(self, value):
        self._rank = value
        self.rank_status_recv = True

    @property
    def ignore_flag(self):
        return self._ignore_flag
        
    @ignore_flag.setter
    def ignore_flag(self, value):
        self._ignore_flag = value

    @property
    def status_recv(self):
        """Returns True if all status has been received"""
        return self.online_status_recv and self.battle_status_recv
        

__all__ = ['ATarget']