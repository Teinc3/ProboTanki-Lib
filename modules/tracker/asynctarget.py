class ATarget:
    """
    Async Target class for tracking player status.
    No lock needed as all access is coordinated by AsyncBaseTracker.
    """

    def __init__(self, name: str, rank: int = 0, names_mode: bool = False):
        self.name = name
        self.names_mode = names_mode

        # Status properties
        self._online = False
        self._battleID = ''
        self._rank = rank
        self._ignore_flag = False

        # Status tracking flags
        self.online_status_recv = False
        self.battle_status_recv = False
        self.rank_status_recv = False
        

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
        """Returns True if both required statuses have been received at least once"""
        return self.online_status_recv and (self.rank_status_recv if self.names_mode else self.battle_status_recv)
        

__all__ = ['ATarget']