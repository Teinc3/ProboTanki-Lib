import os
import time
import requests
import random
from threading import Thread, Lock, Event
from dotenv import load_dotenv, find_dotenv

load_dotenv(find_dotenv())

# Constants
USE_PROXY_FILE = True

ENDPOINT = 'https://s.pro-tanki.com/api'
HEADERS = {
    'accept': 'application/json, text/plain, */*',
    'accept-language': 'en-US,en;q=0.9',
    'content-type': 'application/json',
    'origin': 'https://start.protanki-game.com',
    'referer': 'https://start.protanki-game.com/',
    'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) '
                  'Chrome/130.0.0.0 Safari/537.36'
}
NORD_API_URL = "https://api.nordvpn.com/v1/servers?limit=0"
NORD_CREDENTIALS = {
    "email": os.getenv("EMAIL"),
    "password": os.getenv("PASSWORD")
}

DATA_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'data'))
PROXIES_FILE = os.path.join(DATA_PATH, 'proxies.txt')
INPUT_FILE = os.path.join(DATA_PATH, 'names_available.txt')
OUTPUT_FILE = os.path.join(DATA_PATH, 'registered_accounts.txt')

MAX_PROXY_USES = 5
NUM_WORKERS = 5

# Locks for thread-safe operations
output_lock = Lock()

def name_generator(names: list[str]):
    """
    Generator that yields names from a list of names.

    Args:
        names (list[str]): A list of names to yield.

    Yields:
        str: A name from the list.
    """
    while names:
        yield names.pop(0)

def generate_email_combinations(email: str, max_count: int = 50000):
    """
    Generator that yields username+1, username+2, etc. up to `max_count`.

    Args:
        email (str): The base email address (e.g., "mytest@gmail.com").
        max_count (int): How many numbered emails to generate.

    Yields:
        str: Emails in the format "username+<num>@domain".
    """
    try:
        username, domain = email.split('@')
    except ValueError:
        print(f"Invalid email format: {email}")
        return

    for i in range(1, max_count + 1):
        yield f"{username}+id{i}@{domain}"

def load_proxies() -> list[str]:
    """
    Loads proxies from either the proxies file or NordVPN's public API.

    Returns:
        list[str]: A list of proxy strings in the format 'host:port'.
    """
    proxies = []
    if USE_PROXY_FILE:
        try:
            with open(PROXIES_FILE, 'r') as f:
                for line in f:
                    stripped_line = line.strip()
                    if not stripped_line or not stripped_line[0].isdigit():
                        break
                    proxies.append(stripped_line)
            # Randomize the order of proxies
            random.shuffle(proxies)
        except FileNotFoundError:
            print(f"Proxies file not found at {PROXIES_FILE}")
    else:
        try:
            resp = requests.get(NORD_API_URL, timeout=30)
            resp.raise_for_status()
            data = resp.json()
            for server in data:
                hostname = server.get("station")
                if hostname:
                    proxies.append(f"{hostname}:1080")
        except Exception as e:
            print(f"Error fetching NordVPN servers: {e}")
    return proxies

def load_names() -> list[str]:
    """
    Loads names from the input file.

    Returns:
        list[str]: A list of names.
    """
    try:
        with open(INPUT_FILE, 'r') as f:
            words = f.read().splitlines()
            print(f"Loaded {len(words)} Words.")
            return words
    except FileNotFoundError:
        print(f"Input file not found at {INPUT_FILE}")
        return []

class ProxyWorker(Thread):
    """
    Worker Thread for Each Proxy
    """

    def __init__(self, proxy, combination_generator: callable, stop_event: Event):
        super().__init__()
        self.proxy = proxy
        self.current_proxy = None
        self.proxy_usage = 0

        self.combination_generator = combination_generator
        self.stop_event = stop_event
        self.daemon = True  # Allows thread to be killed when main thread exits

    def run(self):
        session = requests.Session()
        if USE_PROXY_FILE:
            proxy_url = f"http://twjyikvd:yfp7nkalj1mq@{self.proxy}"
        else:
            proxy_url = f"http://{NORD_CREDENTIALS['email']}:{NORD_CREDENTIALS['password']}@{self.proxy()}"

        session.proxies.update({
            'http': proxy_url,
            'https': proxy_url
        })

        while not self.stop_event.is_set() or (not USE_PROXY_FILE and self.proxy_usage >= 5):
            name, email = self.combination_generator()
            if not name or not email:
                self.stop_event.set()

            result = self.create_account(session, name, email)
            print(f"{name}: {result}")
            self.proxy_usage += 1

            time.sleep(1 if not USE_PROXY_FILE else 61)

    def create_account(self, session: requests.Session, username: str, email: str) -> bool:
        """
        Sends a POST request to create an account.

        Args:
            session (requests.Session): The session object with proxy settings.
            username (str): The username for the account.
            email (str): The email address for the account.

        Returns:
            bool: True if the account was created successfully (This is unreliable, check email for confirmation).
        """
        payload = {
            "token": "",
            "name": "referral_register",
            "data": {
                "nickname": username,
                "password": "skibiditoilet",
                "email": email,
                "referral_hash": "8cfe6808a0946e3c64a56678de2f416f"
            }
        }

        try:
            response = session.post(ENDPOINT, headers=HEADERS, json=payload, timeout=20)
            response.raise_for_status()  # Raises HTTPError for bad HTTP status codes
            try:
                response_data: dict = response.json()
                return response_data.get('success')
            except ValueError:
                return False
            
        except requests.exceptions.ProxyError as e:
            print(f"Proxy Error | Proxy: {self.proxy} | Username: {username}, Email: {email} | Error: {e}")

        except requests.exceptions.ConnectTimeout as e:
            print(f"Connection Timeout | Proxy: {self.proxy} | Username: {username}, Email: {email} | Error: {e}")

        except requests.exceptions.ReadTimeout as e:
            print(f"Read Timeout | Proxy: {self.proxy} | Username: {username}, Email: {email} | Error: {e}")

        except requests.exceptions.HTTPError as e:
            print(f"HTTP Error | Proxy: {self.proxy} | Username: {username}, Email: {email} | Status Code: {response.status_code} | Error: {e}")

        except requests.exceptions.RequestException as e:
            print(f"Request Exception | Proxy: {self.proxy} | Username: {username}, Email: {email} | Error: {e}")
        
        return False

    def log_success(self, username: str, email: str):
        """
        Logs successful account creations to a file.

        Args:
            username (str): The username of the created account.
            email (str): The email of the created account.
        """
        with output_lock:
            with open(OUTPUT_FILE, 'a') as f_out:
                f_out.write(f"{username},{email}\n")

def main():
    proxies = iter(load_proxies())
    if not proxies:
        print("No proxies available. Exiting...")
        return

    names = load_names()
    if not names:
        print("No names available. Exiting...")
        return
    
    # Initialize Email Generator
    email_generator = generate_email_combinations("osamagooningskibidi@gmail.com", 50000)
    pair_lock = Lock()
    proxy_lock = Lock()

    def generate_proxy() -> str:
        with proxy_lock:
            return next(proxies)

    def generate_pair() -> tuple[str, str]:
        with pair_lock:
            if names:
                try:
                    email = next(email_generator)
                except StopIteration:
                    # Email generator exhausted
                    return None, None
                name = names.pop(0)
                return name, email
            else:
                # No more names to process
                return None, None

    # Event to signal threads to stop
    stop_event = Event()

    # Create and start a ProxyWorker thread for each proxy
    workers: set[ProxyWorker] = set()
    if USE_PROXY_FILE:
        for proxy in proxies:
            worker = ProxyWorker(proxy, generate_pair, stop_event)
            worker.start()
            workers.add(worker)
            time.sleep(1)
    else:
        # Make proxies a generator
        for _ in range(NUM_WORKERS):
            worker = ProxyWorker(generate_proxy, generate_pair, stop_event)
            worker.start()
            workers.add(worker)
    print(f"Started {len(workers)} Proxy Workers")
    
    try:
        # Keep the main thread alive while workers are processing
        while any(worker.is_alive() for worker in workers):
            time.sleep(1)
    except KeyboardInterrupt:
        print("Exiting... Signaling all workers to stop.")
        stop_event.set()
        for worker in workers:
            worker.join()
        print("All workers have been stopped.")

if __name__ == '__main__':
    main()