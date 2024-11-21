import json
import requests
from threading import Lock

from lib.utils.address import Address as Proxy


class ProxyManager:
    MAX_PROXY_CONNECTIONS = 5

    BANNED_PROXY_LIST = [
        Proxy("198.23.239.134", 6540),
        Proxy("107.172.163.27", 6543),
        Proxy("207.244.217.165", 6712),
        Proxy("64.137.42.112", 5157)
    ]

    def __init__(self, proxies: list[Proxy] = []):
        self.lock = Lock()
        self.all_proxies = self.remove_banned_proxies(proxies)  # List of Proxy objects
        self.proxy_usage = { proxy.__repr__(): 0 for proxy in self.all_proxies }
    
    @property
    def remaining_connections_count(self) -> int:
        with self.lock:
            return sum(self.MAX_PROXY_CONNECTIONS - usage for usage in self.proxy_usage.values())

    def renew_proxies(self, proxies: list[Proxy]):
        with self.lock:
            self.all_proxies.extend(self.remove_banned_proxies(list(filter(lambda proxy: proxy not in self.all_proxies, proxies))))
            for proxy in self.all_proxies:
                if proxy.__repr__() not in self.proxy_usage:
                    self.proxy_usage[proxy.__repr__()] = 0

    def assign_proxy(self) -> Proxy | None:
        """Assign a proxy when requested by a free TankiSocket, if available"""
        with self.lock:
            # Find the minimum usage among all proxies
            min_usage = min(self.proxy_usage.values(), default=0)
            
            # Gather all proxies that have the minimum usage and are below max connections
            available_proxies_repr = [
                proxy_repr for proxy_repr, usage in self.proxy_usage.items()
                if usage == min_usage and usage < self.MAX_PROXY_CONNECTIONS
            ]

            if not available_proxies_repr:
                # No proxies available with usage < MAX_PROXY_CONNECTIONS
                return None

            # Select the first available proxy with the least usage
            selected_proxy_repr = available_proxies_repr[0]
            self.proxy_usage[selected_proxy_repr] += 1

            # Retrieve the Proxy object by searching the list for the proxy with the same repr
            selected_proxy = next(proxy for proxy in self.all_proxies if proxy.__repr__() == selected_proxy_repr)
            return selected_proxy
        
    def purge_proxy(self, proxy: Proxy):
        """Delete a proxy from the set, if it cannot connect anymore"""
        proxy_repr = proxy.__repr__()
        with self.lock:
            if proxy_repr in self.proxy_usage:
                self.all_proxies.remove(proxy)
                del self.proxy_usage[proxy_repr]
    
    def fetch_proxies(self):
        """
        Fetch proxies from the Webshare API
        idc about exposed token as this is a free account
        """
        response = requests.get(
            "https://proxy.webshare.io/api/v2/proxy/list/?mode=direct&page=1&page_size=25",
            headers={ "Authorization": "Token q5op7rl3joa4c8syvyvdco5jwylznuvyktcbsk3s" }
        )
        
        result = response.json()

        if not result or 'results' not in result:
            raise Exception("Failed to fetch proxies from Webshare API")
        
        fetched_proxies = [
            Proxy(proxy['proxy_address'], int(proxy['port']), proxy['username'] if 'username' in proxy else None, proxy['password'] if 'password' in proxy else None)
            for proxy in result['results'] 
            if proxy and 'proxy_address' in proxy and 'port' in proxy and 'valid' in proxy and proxy['valid']
        ]

        self.renew_proxies(fetched_proxies)

        print(f"Fetched and Renewed {len(fetched_proxies)} Proxies.")

    @staticmethod
    def remove_banned_proxies(proxies: list[Proxy]):
        return list(filter(lambda p: not any(p.host == b_p.host and p.port == b_p.port for b_p in ProxyManager.BANNED_PROXY_LIST), proxies))
    

class CredentialManager:
    def __init__(self, credentials: list[dict] = []):
        self.lock = Lock()
        self.all_credentials = credentials  # List of dict objects
        self.current_index = 0

    @property
    def remaining_accounts_count(self) -> int:
        with self.lock:
            return len(self.all_credentials) - self.current_index

    def renew_credentials(self, credentials: list[dict]):
        with self.lock:
            # Check for duplicates before adding new
            credentials = filter(lambda cred: cred not in self.all_credentials, credentials)
            self.all_credentials.extend(credentials)
    
    def get_next_credentials(self) -> dict | None:
        with self.lock:
            if self.current_index >= len(self.all_credentials):
                return None
            credentials = self.all_credentials[self.current_index]
            self.current_index += 1
            return credentials
        
    def load_credentials(self, abspath: str):
        # Main file scrapes credentials file for accounts to use
        with open(abspath) as f:
            credentials: dict = json.load(f)
        
            if len(credentials) == 0 or any('username' not in account or 'password' not in account for account in credentials):
                raise Exception(f"No accounts found in {abspath}")
            
            self.renew_credentials(credentials)