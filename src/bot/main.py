import os
import sys
import json
from pyee import EventEmitter

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))) # To access src/
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'lib'))) # To access modules within src/lib/

from tankisocket import TankiSocket
from callbackholder import CallbackHolder


class TankiBot:
    credentials: dict

    watchdog: TankiSocket
    sheep: set[TankiSocket]

    event_emitter: EventEmitter

    def __init__(self):
        self.event_emitter = EventEmitter()
        self.event_emitter.on('main_battle_created', self.init_sheep)

        # Main file scrapes credentials file for accounts to use
        with open(os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", "credentials.json"))) as f:
            self.credentials = json.load(f)
        
        if 'accounts' not in self.credentials or len(self.credentials['accounts']) == 0:
            raise Exception("No accounts found in credentials.json")

        # Select the 1st account as watchdog and instantiate a socket instance
        watchdog_credentials = self.credentials['accounts'][0]
        if 'username' not in watchdog_credentials or 'password' not in watchdog_credentials:
            raise Exception("Invalid credentials format")
        
        self.watchdog = TankiSocket(CallbackHolder(
            storage = { 'credentials': watchdog_credentials },
            event_emitter = self.event_emitter,
            watchdog = True
        ))

    def init_sheep(self, selected_battle_data: dict):
        max_player_count = selected_battle_data['maxPeopleCount']
        self.sheep = set()

        # Instantiate a socket instance for each account
        for account in self.credentials['accounts'][1:max_player_count+1]:
            if 'username' not in account or 'password' not in account:
                continue

            self.sheep.add(TankiSocket(CallbackHolder(
                storage = { 'credentials': account, 'selected_battle': selected_battle_data },
                event_emitter = self.event_emitter,
                watchdog = False
            )))

if __name__ == "__main__":
    TankiBot()
        