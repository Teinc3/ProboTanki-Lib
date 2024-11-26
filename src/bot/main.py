import os
import sys
from pyee import EventEmitter
from threading import Lock
import time

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))  # To access src/
sys.path.append(
    os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'lib')))  # To access modules within src/lib/

from bot.accountmanager import AccountManager
from tankisocket import TankiSocket
from callbackholder import CallbackHolder


class TankiBot:
    watchdog: TankiSocket
    sheep: list[TankiSocket]
    sheeps_ready: set[int]
    battle_size: int

    MAX_PLAYER_COUNTS = {
        "map_serpuhov": 20,
        "map_madness": 32,
    }
    BATTLE_MODE = 1 # DM, 1 = TDM
    SELECTED_MAP = "map_serpuhov"
    SOCKET_FAILURE_BUFFER_COUNT = 0
    MAX_BATTLE_SIZE = MAX_PLAYER_COUNTS[SELECTED_MAP] * (1 if BATTLE_MODE == 0 else 2 )

    def __init__(self):
        self.account_manager = AccountManager()
        self.event_emitter = EventEmitter()

        self.sheep_lock = Lock()

        self.set_event_listeners()
        self.init_watchdog()
        
    def init_watchdog(self):
        watchdog_account = self.account_manager.get_next_account()
        self.watchdog = TankiSocket(CallbackHolder(
            storage = { 
                'credentials': AccountManager.get_account_credentials(watchdog_account),
                'proxy': AccountManager.get_account_proxy(watchdog_account)
            },
            event_emitter = self.event_emitter,
            watchdog = True
        ))

    def set_event_listeners(self):
        self.event_emitter.on('watchdog_ready', self.start_sheep)
        self.event_emitter.on('sheep_ready', self.sheep_ready)
        self.event_emitter.on('delete_sheep', self.delete_sheep)
        self.event_emitter.on('retry_socket', self.retry_socket)
    
    def start_sheep(self):
        # Instantiate sheeps for Serpuhovs
        if hasattr(self, 'sheep') and len(self.sheep) > 0:
            return
        self.sheep = []
        sheep_needed = min(self.account_manager.accounts_remaining, self.MAX_BATTLE_SIZE + self.SOCKET_FAILURE_BUFFER_COUNT)
        self.battle_size = min(sheep_needed - self.SOCKET_FAILURE_BUFFER_COUNT, self.MAX_BATTLE_SIZE)

        for i in range(sheep_needed):
            sheep_account = self.account_manager.get_next_account()
            self.sheep.append(TankiSocket(CallbackHolder(
                storage={
                    'sheep_id': i, 
                    'credentials': AccountManager.get_account_credentials(sheep_account),
                    'proxy': AccountManager.get_account_proxy(sheep_account),
                },
                event_emitter=self.event_emitter,
                watchdog=False
            )))

    def sheep_ready(self, sheep_id: int, ready_state: bool):
        if not hasattr(self, 'sheeps_ready'):
            self.sheeps_ready = set()
        if ready_state:
            self.sheeps_ready.add(sheep_id)
            print(f"Current Threshold: {len(self.sheeps_ready)}/{self.battle_size}")
        elif sheep_id in self.sheeps_ready:
            self.sheeps_ready.remove(sheep_id)
            print(f"Current Threshold: {len(self.sheeps_ready)}/{self.battle_size}")

        if len(self.sheeps_ready) == self.battle_size and ('selected_battle' not in self.watchdog.holder.storage or 'battleID' not in self.watchdog.holder.storage['selected_battle']):
            print("Most Sheep ready, waiting for battle creation...")
            print(f"Current Threshold: {len(self.sheeps_ready)}/{self.battle_size}")

        if len(self.sheeps_ready) == self.battle_size and ('selected_battle' not in self.watchdog.holder.storage or 'battleID' not in self.watchdog.holder.storage['selected_battle']):
            print("Most Sheep ready, waiting for battle creation...")
            self.event_emitter.emit('all_sheep_ready', { 
                'mapID': self.SELECTED_MAP,
                'battleMode': self.BATTLE_MODE,
                'maxPeopleCount': self.battle_size if self.BATTLE_MODE == 0 else self.battle_size // 2,
                'name': self.SELECTED_MAP.replace("map_", "").capitalize() + " " + ("DM" if self.BATTLE_MODE == 0 else "TDM")
            })

    def delete_sheep(self, sheep_id: int):
        # Find the sheep by ID and remove it from the list
        with self.sheep_lock:
            sheep = next((sheep for sheep in self.sheep if sheep.holder.storage['sheep_id'] == sheep_id), None)
            if sheep is not None:
                self.sheep.remove(sheep)

    def retry_socket(self, holder: CallbackHolder, retries: int):
        # Retry the socket connection with the same credentials and proxy
        if holder.watchdog:
            if retries >= TankiSocket.MAX_RETRIES_POSSIBLE:
                print(f"Max {retries} retries reached for Watchdog, waiting 3 minutes before retrying connection.")
                time.sleep(180)
                storage = { 'credentials': holder.storage['credentials'], 'proxy': holder.storage['proxy'] }
                retries = 0
            else:
                # Remove 'mods_info' from storage before reassigning storage to new watchdog instance
                holder.storage.pop('mods_info', None)
                storage = holder.storage
            self.watchdog = TankiSocket(CallbackHolder(
                storage = storage,
                event_emitter = self.event_emitter,
                watchdog = True
            ))
            self.watchdog.retries = retries
        else:
            # Find the sheep by ID and remove
            self.delete_sheep(holder.storage['sheep_id'])

            with self.sheep_lock:
                new_socket = TankiSocket(holder)
                new_socket.retries = retries
                self.sheep.append(new_socket)

    def delete_sheep(self, sheep_id: int):
        # Find the sheep by ID and remove it from the list
        with self.sheep_lock:
            sheep = next((sheep for sheep in self.sheep if sheep.holder.storage['sheep_id'] == sheep_id), None)
            if sheep is not None:
                self.sheep.remove(sheep)

    def retry_socket(self, holder: CallbackHolder, retries: int):
        # Retry the socket connection with the same credentials and proxy
        if holder.watchdog:
            if retries >= TankiSocket.MAX_RETRIES_POSSIBLE:
                print(f"Max {retries} retries reached for Watchdog, waiting 3 minutes before retrying connection.")
                time.sleep(180)
                storage = { 'credentials': holder.storage['credentials'], 'proxy': holder.storage['proxy'] }
                retries = 0
            else:
                holder.storage.pop('mods_info', None)
                storage = holder.storage
            self.watchdog = TankiSocket(CallbackHolder(
                storage = storage,
                event_emitter = self.event_emitter,
                watchdog = True
            ))
            self.watchdog.retries = retries
        else:
            # Find the sheep by ID and remove
            self.delete_sheep(holder.storage['sheep_id'])

            with self.sheep_lock:
                new_socket = TankiSocket(holder)
                new_socket.retries = retries
                self.sheep.append(new_socket)

if __name__ == "__main__":
    TankiBot()
