import json
import re


class Processor:
    @staticmethod
    def process_packets(packet_data: str):
        if '"itemId"' in packet_data:
            match = re.search(r'\{.*}', packet_data)
            if match:
                json_data = match.group(0)

                json_data = json_data.strip("{}")
                json_data = "{" + json_data + "}"

                json_data = json_data.encode().decode('unicode_escape')

                try:
                    data = json.loads(json_data)

                    user_names = []

                    for key in ['usersBlue', 'usersRed', 'users']:
                        if key in data:
                            user_names.extend([user['user'] for user in data[key] if 'user' in user])

                    if user_names:
                        print("Current users: " + str(user_names))
                        # move to stage 2, dynamic packet parsing, parse the packet based on map actions, user joined,
                        # user left, user moved. Stage 3, calculate incarnation ids (global) assign them to users based
                        # on their death. Stage 4, kills all the noobs. Stage 5, profit.
                except json.JSONDecodeError as e:
                    print("Failed to parse JSON data:", e)
                    print("Problematic JSON data:", json_data)
            else:
                print("No JSON data found in packet.")
