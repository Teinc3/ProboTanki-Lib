import os
import sys
from pyee import EventEmitter

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))) # To access src/
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'lib'))) # To access modules within src/lib/

from rotator import ProxyManager, CredentialManager
from tankisocket import TankiSocket
from callbackholder import CallbackHolder


class TankiBot:
    watchdog: TankiSocket
    sheep: list[TankiSocket]
    sheeps_ready: set[int]
    battle_size: int

    CREDENTIALS_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", "data", "credentials.json"))
    MAX_PLAYER_COUNTS = {
        "map_serpuhov": 20,
        "map_madness": 32,
    }
    BATTLE_MODE = 1 # DM, 1 = TDM
    SELECTED_MAP = "map_serpuhov"
    SOCKET_FAILURE_BUFFER_COUNT = 5

    def __init__(self):
        self.proxy_manager = ProxyManager()
        self.credential_manager = CredentialManager()
        self.event_emitter = EventEmitter()

        self.load_data()
        self.set_event_listeners()
        self.start_cycle()

    def load_data(self):
        self.proxy_manager.fetch_proxies()
        self.credential_manager.load_credentials(self.CREDENTIALS_PATH)

    def set_event_listeners(self):
        self.event_emitter.on('sheep_ready', self.sheep_ready)
        pass
    
    def start_cycle(self):
        self.watchdog = TankiSocket(CallbackHolder(
            storage = { 'credentials': self.credential_manager.get_next_credentials(), 'proxy': self.proxy_manager.assign_proxy() },
            event_emitter = self.event_emitter,
            watchdog = True
        ))

        # Instantiate sheeps for Serpuhovs
        self.sheep = []
        max_sheep = min(self.credential_manager.remaining_accounts_count, self.proxy_manager.remaining_connections_count)
        sheep_needed = min(max_sheep, self.MAX_PLAYER_COUNTS[self.SELECTED_MAP] + self.SOCKET_FAILURE_BUFFER_COUNT)
        self.battle_size = min(sheep_needed, self.MAX_PLAYER_COUNTS[self.SELECTED_MAP])

        for i in range(sheep_needed):
            self.sheep.append(TankiSocket(CallbackHolder(
                storage = { 'sheep_id': i, 'credentials': self.credential_manager.get_next_credentials(), 'proxy': self.proxy_manager.assign_proxy() },
                event_emitter = self.event_emitter,
                watchdog = False
            )))

    def sheep_ready(self, sheep_id: int, ready_state: bool):
        if not hasattr(self, 'sheeps_ready'):
            self.sheeps_ready = set()
        if ready_state:
            self.sheeps_ready.add(sheep_id)
        else:
            self.sheeps_ready.remove(sheep_id)
        if len(self.sheeps_ready) == self.battle_size:
            print("Sheep ready, waiting for battle creation...")
            self.event_emitter.emit('all_sheep_ready', { 
                'mapID': self.SELECTED_MAP,
                'battleMode': self.BATTLE_MODE,
                'maxPeopleCount': self.battle_size,
                'name': self.SELECTED_MAP.replace("map_", "").capitalize() + " " + ("DM" if self.BATTLE_MODE == 0 else "TDM")
            })

if __name__ == "__main__":
    TankiBot()
        