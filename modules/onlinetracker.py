from threading import Lock


class OnlineTracker:
    def __init__(self, targets: list[str]):
        self.targets = targets
        self.target_online_status = {target: False for target in targets}
        self.target_battle_status = {target: '' for target in targets} 

        self.status_lock = Lock()

    def update_online_status(self, target: str, status: bool):
        with self.status_lock:
            self.target_online_status[target] = status
            

    def update_battle_status(self, target: str, status: str):
        with self.status_lock:
            self.target_battle_status[target] = status