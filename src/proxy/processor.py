import json
import re
from collections import defaultdict

# Define user_data as a global variable
user_data = defaultdict(lambda: 1)


class Processor:
    def __init__(self):
        self.item_id = None

    def process_packets(self, packet_data: str):
        global user_data

        if "Rotated_Turret" in packet_data:
            match = re.search(r"'username': '([^']*)'", packet_data)
            if match:
                username = match.group(1)
                if username not in user_data:
                    user_data[username] = 1
                    # print(dict(user_data))

        elif "Load_Battle_Info" in packet_data:
            json_match = re.search(r"'json': '([^']*)'", packet_data)
            if json_match:
                json_data = json_match.group(1).replace("'", '"')
                battle_info = json.loads(json_data)
                battle_mode = battle_info.get("battleMode")
                self.item_id = battle_info.get("itemId")
                if battle_mode != "DM":
                    return
                # print(f"ItemId: {self.item_id}")
                user_data.clear()
                for user_info in battle_info.get("users", []):
                    user = user_info.get("user")
                    if user and user not in user_data:
                        user_data[user] = 1
                # print(dict(user_data))

        elif "Left_Battle_Status" in packet_data:
            match = re.search(r"'username': '([^']*)'", packet_data)
            if match:
                username = match.group(1)
                if username in user_data:
                    del user_data[username]
                    # print(dict(user_data))

        elif "Update_Battle_Player_Statistics" in packet_data:
            match = re.search(r"'userStats': \{'deaths': (\d+), 'kills': \d+, 'score': \d+, 'username': '([^']*)'}",
                              packet_data)
            if match:
                deaths = int(match.group(1))
                username = match.group(2)
                if username in user_data:
                    user_data[username] = deaths + 1
                # print(dict(user_data))
