import json
import os
import time
import requests
from bisect import bisect_left
from itertools import combinations


def generate_dot_combinations(base):
    n = len(base)
    for num_dots in range(1, n):
        for positions in combinations(range(1, n), num_dots):
            new_email = list(base)
            for pos in positions:
                new_email.insert(pos, '.')
            yield ''.join(new_email)


def generate_unique_email(existing_emails, base):
    domain = "@gmail.com"
    for email_base in generate_dot_combinations(base):
        candidate_email = f"{email_base}{domain}"
        if binary_search(existing_emails, candidate_email) == -1:
            return candidate_email
    raise ValueError("Unable to generate a unique email. Exhausted all dot combinations.")


def binary_search(sorted_list, target):
    index = bisect_left(sorted_list, target)
    if index < len(sorted_list) and sorted_list[index] == target:
        return index
    return -1


def generate_password():
    return "skibiditoilet"


def load_json_file(filepath):
    with open(filepath, 'r') as file:
        return json.load(file)


def save_json_file(filepath, data):
    with open(filepath, 'w') as file:
        json.dump(data, file, indent=2)


class AccountGenerator:
    url = 'https://s.pro-tanki.com/api'
    headers = {
        'accept': 'application/json, text/plain, */*',
        'accept-language': 'en-US,en;q=0.9',
        'content-type': 'application/json',
        'origin': 'https://start.protanki-game.com',
        'referer': 'https://start.protanki-game.com/',
        'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) '
                      'Chrome/130.0.0.0 Safari/537.36'
    }

    credentials_file_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '../../../../data/names.json'))
    existing_emails_file_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '../../../../data'
                                                                                        '/existing_emails.json'))

    def __init__(self, account_count):
        self.account_count = account_count
        self.data = load_json_file(self.credentials_file_path)
        self.existing_emails = []
        self.loaded_external_emails = []

    def collect_existing_emails(self):
        self.existing_emails = sorted(
            entry['email'] for entry in self.data if 'email' in entry
        )
        self.loaded_external_emails = load_json_file(self.existing_emails_file_path)
        self.existing_emails += self.loaded_external_emails
        self.existing_emails = sorted(set(self.existing_emails))
        print(f"Collected {len(self.existing_emails)} existing emails (internal + external).")

    def save_new_email(self, email):
        self.loaded_external_emails.append(email)
        save_json_file(self.existing_emails_file_path, self.loaded_external_emails)

    def add_missing_info(self):
        for entry in self.data:
            if "info" not in entry:
                entry["info"] = {"rank": 1}

    def create_account(self, username, email):
        password = generate_password()
        payload = {
            "token": "",
            "name": "referral_register",
            "data": {
                "nickname": username,
                "password": password,
                "email": email,
                "referral_hash": "8c386814e67420ba3bf03c49d390f2eb"
            }
        }
        response = requests.post(self.url, headers=self.headers, json=payload)
        print(f"Account Generation | Username: {username}, Email: {email}, Password: {password}, "
              f"Response: {response.json()}")
        return 'success' in response.json() and response.json()['success']

    def update_json_data(self):
        generated_count = 0
        for entry in self.data:
            if generated_count >= self.account_count:
                break

            if 'email' not in entry and 'username' in entry:
                username = entry['username']
                while True:
                    email = generate_unique_email(self.existing_emails, "osamagoonerskibidi")
                    if email not in self.loaded_external_emails:
                        break
                if self.create_account(username, email):
                    entry['email'] = email
                    entry['railgun'] = -1
                    self.existing_emails.append(email)
                    self.existing_emails.sort()
                    self.save_new_email(email)
                    generated_count += 1
                time.sleep(1)

        print(f"Generated {generated_count} new accounts.")

    def save_updated_data(self):
        save_json_file(self.credentials_file_path, self.data)


if __name__ == "__main__":
    generator = AccountGenerator(1)  # 20 new fresh skibiditoiletsigmamaleonthewallfortnitealphanogirlinlife accounts
    generator.collect_existing_emails()
    generator.add_missing_info()
    generator.update_json_data()
    generator.save_updated_data()
