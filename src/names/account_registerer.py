import os
import time
import requests
import itertools
from threading import Thread, Lock, Event

# Constants
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

DATA_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'data'))
PROXIES_FILE = os.path.join(DATA_PATH, 'proxies.txt')
INPUT_FILE = os.path.join(DATA_PATH, 'natural_language_corpus_words.txt')
OUTPUT_FILE = os.path.join(DATA_PATH, 'registered_accounts.txt')

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

def generate_email_combinations(email: str, max_dots: int = 1):
    """
    Generator that yields all possible dot combinations of the email username.

    Args:
        email (str): The email address to generate dot combinations for.
        max_dots (int): Maximum number of consecutive dots to insert between characters.

    Yields:
        str: Modified email address with dots inserted in the username.
    """
    try:
        username, domain = email.split('@')
    except ValueError:
        print(f"Invalid email format: {email}")
        return

    separators = ['.' * i for i in range(max_dots + 1)]
    positions = len(username) - 1

    for dots in itertools.product(separators, repeat=positions):
        combined_username = ''.join(char + sep for char, sep in zip(username, dots + ('',)))
        yield f"{combined_username}@{domain}"

class ProxyWorker(Thread):
    """
    Worker Thread for Each Proxy
    """
    def __init__(self, proxy: str, generator: callable, stop_event: Event):
        super().__init__()
        self.proxy = proxy
        self.generator = generator
        self.stop_event = stop_event
        self.daemon = True  # Allows thread to be killed when main thread exits

    def run(self):
        session = requests.Session()
        proxy_url = f"http://twjyikvd:yfp7nkalj1mq@{self.proxy}"
        session.proxies.update({
            'http': proxy_url,
            'https': proxy_url
        })

        while not self.stop_event.is_set():
            name, email = self.generator()
            if not name or not email:
                self.stop_event.set()

            success = self.create_account(session, name, email)
            if success:
                self.log_success(name, email)

            time.sleep(2.5)  # Sleep to avoid rate limiting

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
                "referral_hash": "8c386814e67420ba3bf03c49d390f2eb"
            }
        }

        try:
            response = session.post(ENDPOINT, headers=HEADERS, json=payload, timeout=20)
            try:
                response_data: dict = response.json()
                return response_data.get('success', False)
            except ValueError:
                return False
            
        except requests.exceptions.ProxyError:
            print(f"Proxy Error | Proxy: {self.proxy} | Username: {username}, Email: {email}")
        except requests.exceptions.ConnectTimeout:
            print(f"Connection Timeout | Proxy: {self.proxy} | Username: {username}, Email: {email}")
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

def load_proxies() -> list[str]:
    """
    Loads proxies from the proxies file.

    Returns:
        list[str]: A list of proxy strings in the format 'host:port'.
    """
    proxies = []
    try:
        with open(PROXIES_FILE, 'r') as f:
            for line in f:
                stripped_line = line.strip()
                if not stripped_line or not stripped_line[0].isdigit():
                    break
                proxies.append(stripped_line)
    except FileNotFoundError:
        print(f"Proxies file not found at {PROXIES_FILE}")
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

def main():
    proxies = load_proxies()
    if not proxies:
        print("No proxies available. Exiting...")
        return

    names = load_names()
    if not names:
        print("No names available. Exiting...")
        return
    
    # Initialize Email Generator
    email_generator = generate_email_combinations("osamagooningskibidi@gmail.com", max_dots=1)
    pair_lock = Lock()

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
    for proxy in proxies:
        worker = ProxyWorker(proxy, generate_pair, stop_event)
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