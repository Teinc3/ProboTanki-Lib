import os
import json

from lib.utils import Address as Proxy


class AccountManager:
    WATCHDOG_FILE_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'data', 'watchdog.json'))
    ACCOUNTS_FILE_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'data', 'accounts.json'))

    def __init__(self):
        self.current_account_index = 0

        with open(self.WATCHDOG_FILE_PATH, 'r') as f:
            self.watchdog: dict = json.load(f)

        with open(self.ACCOUNTS_FILE_PATH, 'r') as f:
            self.accounts: list[dict] = json.load(f)
            print(f"Loaded {len(self.accounts)} accounts")

    def get_next_account(self) -> dict:
        account = self.accounts[self.current_account_index]
        self.current_account_index += 1
        return account
    
    @property
    def accounts_remaining(self) -> int:
        return len(self.accounts) - self.current_account_index
    
    @staticmethod
    def get_account_proxy(account: dict):
        if 'proxy' not in account:
            raise Exception('Proxy not found in provided account')
        proxy_obj = account['proxy']
        if 'host' not in proxy_obj or 'port' not in proxy_obj:
            raise Exception('Proxy object is not valid')
        return Proxy(proxy_obj['host'], proxy_obj['port'], "twjyikvd", "yfp7nkalj1mq")
    
    @staticmethod
    def get_account_credentials(account: dict):
        if 'password' not in account:
            account['password'] = "skibiditoilet" # Default password
        return account