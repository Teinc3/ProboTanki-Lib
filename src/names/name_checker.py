import os
import requests
import time
from threading import Thread, Lock, Event

DATA_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'data'))
NAME_FILE = os.path.join(DATA_PATH, 'names', 'list', 'natural_language_corpus_words.txt')
PROXIES_FILE = os.path.join(DATA_PATH, 'proxies.txt')
OUTPUT_FILE = os.path.join(DATA_PATH, 'names', 'list', 'names_available.txt')
API_URL = "https://s.pro-tanki.com/api"

names_lock = Lock()
output_lock = Lock()
stop_event = Event()
NAMES = []
AVAILABLE = []

def load_names():
    if not os.path.isfile(NAME_FILE):
        return []
    with open(NAME_FILE, 'r') as f:
        return f.read().splitlines()

def load_proxies():
    if not os.path.isfile(PROXIES_FILE):
        return []
    with open(PROXIES_FILE, 'r') as f:
        lines = [line.strip() for line in f if line[0].isdigit()]
    return lines

def get_name():
    with names_lock:
        return NAMES.pop(0) if NAMES else None

class NameChecker(Thread):
    def __init__(self, proxy):
        super().__init__()
        self.proxy = proxy
        self.daemon = True

    def run(self):
        session = requests.Session()
        proxy_url = f"http://twjyikvd:yfp7nkalj1mq@{self.proxy}"
        session.proxies.update({
            'http': proxy_url,
            'https': proxy_url
        })
        while not stop_event.is_set():
            nickname = get_name()
            if not nickname:
                stop_event.set()
                break
            self.check_nickname(session, nickname)
            time.sleep(2)

    def check_nickname(self, session, nickname):
        payload = {
            "token": "",
            "name": "check_referral_nickname",
            "data": {"nickname": nickname}
        }
        try:
            r = session.post(API_URL, json=payload, timeout=10)
            data = r.json()
            if data.get("result") == "ok":
                with output_lock:
                    AVAILABLE.append(nickname)
        except:
            pass

def main():
    global NAMES
    NAMES = load_names()
    if not NAMES:
        print("No names to check.")
        return
    proxies = load_proxies()
    if not proxies:
        print("No proxies to use.")
        return

    workers = []
    for proxy in proxies:
        w = NameChecker(proxy)
        w.start()
        workers.append(w)

    for w in workers:
        w.join()

    with open(OUTPUT_FILE, 'w') as f_out:
        for name in AVAILABLE:
            f_out.write(name + "\n")

if __name__ == "__main__":
    main()