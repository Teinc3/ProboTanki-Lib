import requests
import json
import random
import string
import os

class AccountGenerator():

    url = 'https://s.pro-tanki.com/api'
    headers = {
        'accept': 'application/json, text/plain, */*',
        'accept-language': 'en-US,en;q=0.9',
        'content-type': 'application/json',
        'origin': 'https://start.protanki-game.com',
        'priority': 'u=1, i',
        'referer': 'https://start.protanki-game.com/',
        'sec-ch-ua': '"Chromium";v="130", "Google Chrome";v="130", "Not?A_Brand";v="99"',
        'sec-ch-ua-mobile': '?0',
        'sec-ch-ua-platform': '"Windows"',
        'sec-fetch-dest': 'empty',
        'sec-fetch-mode': 'cors',
        'sec-fetch-site': 'cross-site',
        'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 '
                    'Safari/537.36'
    }
    credentials_file_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '../../../data/credentials.json'))

    def __init__(self):
        all_credentials = []

        for _ in range(65):
            nickname = self.generate_random_name()#generate_gamer_name()
            password = self.generate_password()
            email = f"{nickname.lower()}@gmail.com"
            payload = {
                "token": "",
                "name": "referral_register",
                "data": {
                    "nickname": nickname,
                    "password": password,
                    "email": email,
                    "referral_hash": "8c386814e67420ba3bf03c49d390f2eb"
                }
            }
            response = requests.post(self.url, headers=self.headers, json=payload)
            if response.status_code != 200:
                print(f"Failed to create account: {nickname}")
                continue
            credentials = {
                "username": nickname,
                "password": password,
                "rank": 1
            }
            all_credentials.append(credentials)

        with open(self.credentials_file_path, "w") as f:
            json.dump({"accounts": all_credentials}, f, indent=3)

    def generate_gamer_name():
        # Maybe change the names, so it's not that obvious and cringe?!
        adjectives = ["Dark", "Epic", "Shadow", "Mystic", "Savage", "Stealthy", "Vengeful", "Silent", "Infernal", "Blazing"]
        nouns = ["Reaper", "Ninja", "Hunter", "Warrior", "Phantom", "Assassin", "Wraith", "Titan", "Rogue", "Dragon"]
        pattern = random.choice([0, 1, 2])
        if pattern == 0:
            return ''.join(random.choices(string.digits, k=3)) + random.choice(adjectives) + random.choice(nouns)
        elif pattern == 1:
            return random.choice(adjectives) + ''.join(random.choices(string.digits, k=3)) + random.choice(nouns)
        else:
            return random.choice(adjectives) + random.choice(nouns) + ''.join(random.choices(string.digits, k=3))

    def generate_random_name():
        # A-Za-z0-9\._- allowed, symbols not allowed as 1st or last char, 2 symbols cannot be together
        special_chars = "._-"
        allowed_chars = string.ascii_letters + string.digits + special_chars
        name = ''
        i = 0
        while i < 20:
            name += random.choice(allowed_chars)
            if i in [0, 19] and name[i] in special_chars or name[i] in special_chars and name[i-1] in special_chars:
                name = name[:-1]
                continue
            i += 1
        
        return name
            
    def generate_password():
        return "skibiditoilet"
        #return ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(12))

if __name__ == "__main__":
    AccountGenerator()