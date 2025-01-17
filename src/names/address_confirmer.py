import os
import json
from concurrent.futures import ThreadPoolExecutor
import requests

DATA_DIR_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'data'))
EMAIL_REGISTRATIONS_FILE = os.path.join(DATA_DIR_PATH, 'email_registrations.json')
PROXIES_FILE = os.path.join(DATA_DIR_PATH, 'proxies.txt')


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
                    continue
                proxies.append(stripped_line)
    except FileNotFoundError:
        print(f"Proxies file not found at {PROXIES_FILE}")
    return proxies

def load_accounts() -> list[str]:
    """
    Loads the links required to confirm the email of an account.

    Returns:
        list[str]: A list of email confirmation links.
    """
    try:
        with open(EMAIL_REGISTRATIONS_FILE, 'r') as f:
            accounts = json.load(f)
        return [account['link'] for account in accounts if 'link' in account]
    except FileNotFoundError:
        print(f"Email registrations file not found at {EMAIL_REGISTRATIONS_FILE}")
        return []
    except json.JSONDecodeError:
        print(f"Error decoding JSON from {EMAIL_REGISTRATIONS_FILE}")
        return []

def confirm_account(index: int, link: str, proxy: str):
    """
    Confirms an account by sending a GET request to the confirmation link using a proxy.

    Args:
        link (str): The email confirmation link.
        proxy (str): The proxy to use for the request.
    """
    proxy = f"twjyikvd:yfp7nkalj1mq@{proxy}"

    proxies = {
        'http': f'http://{proxy}',
        'https': f'http://{proxy}',
    }
    try:
        _ = requests.get(link, proxies=proxies, timeout=20)
    except requests.RequestException as e:
        print(f"Exception when confirming {index} | Error: {e} | Link: {link})")

def main():
    proxies = load_proxies()
    if not proxies:
        print("No proxies available. Exiting...")
        return
    proxy_count = len(proxies)

    accounts = load_accounts()
    if not accounts:
        print("No accounts available. Exiting...")
        return

    # Use a thread pool to allocate proxies to each account confirmation request
    with ThreadPoolExecutor(max_workers=25) as executor:
        for i, link in enumerate(accounts):
            proxy = proxies[i % proxy_count]
            executor.submit(confirm_account, i, link, proxy)

if __name__ == '__main__':
    main()