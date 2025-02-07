from threading import Lock

class Target:
    def __init__(self, name: str, rank: int = 0, names_mode: bool = False):
        self.name = name
        self.names_mode = names_mode

        self._online = False
        self._battleID = ''
        self._rank = rank

        self._ignore_flag = False

        self.online_status_recv = False
        self.battle_status_recv = False
        self.rank_status_recv = False

        self.lock = Lock()

    @property
    def online(self):
        with self.lock:
            return self._online
    
    @online.setter
    def online(self, value):
        with self.lock:
            self._online = value
            self.online_status_recv = True

    @property
    def battleID(self):
        with self.lock:
            return self._battleID
    
    @battleID.setter
    def battleID(self, value):
        with self.lock:
            self._battleID = value
            self.battle_status_recv = True

    @property
    def rank(self):
        with self.lock:
            return self._rank
    
    @rank.setter
    def rank(self, value):
        with self.lock:
            self._rank = value
            self.rank_status_recv = True

    @property
    def ignore_flag(self):
        with self.lock:
            return self._ignore_flag
        
    @ignore_flag.setter
    def ignore_flag(self, value):
        with self.lock:
            self._ignore_flag = value

    @property
    def status_recv(self):
        with self.lock:
            # Returns True if both required statuses have been received at least once
            return self.online_status_recv and (self.rank_status_recv if self.names_mode else self.battle_status_recv)
        
__all__ = ['Target']