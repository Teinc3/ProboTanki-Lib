import threading
import time
import datetime as date
import random

from bot.enums import ProcessorIDs
from lib.modules import packetManager
from .abstractprocessor import AbstractProcessor


class BattleProcessor(AbstractProcessor):
    processorID = ProcessorIDs.P_BATTLE

    def __init__(self, holder):
        super().__init__(holder)

        self._task_thread = None
        self.current_sheep = None

        self._client_time = 0
        self._last_client_time = date.datetime.now()
        self.server_time = 0

        self.is_spawned = False
        self.sheep_list = []

        self.start_battle_loop()

    @property
    def client_time(self):
        now = date.datetime.now()
        elapsed_time = (now - self._last_client_time).total_seconds() * 1000
        self._client_time += int(1 * elapsed_time)
        self._last_client_time = now
        return self._client_time

    @client_time.setter
    def client_time(self, value):
        self._client_time = value
        self._last_client_time = date.datetime.now()

    def process_packets(self):
        packet_data = self.current_packet.object

        if self.compare_packet("Start_Resp_Fantom"):
            username = packet_data['username']
            team = packet_data['team']
            position = packet_data['position']
            incarnation_id = packet_data['incarnationID']

            # If no such sheep exists, add it to the list
            if not any(sheep['username'] == username for sheep in self.sheep_list):
                self.sheep_list.append({
                    'username': username,
                    'team': team,
                    'position': position,
                    'incarnationID': incarnation_id
                })

                if self.holder.storage['credentials']['username'] == username:
                    self.current_sheep = {
                        'username': username,
                        'team': team,
                        'position': position,
                        'incarnationID': incarnation_id
                    }
            else:
                # Update sheep incarnation ID
                for sheep in self.sheep_list:
                    if sheep['username'] == username:
                        sheep['incarnationID'] = incarnation_id

        elif self.compare_packet("Kill_Confirm"):
            target = packet_data['target']
            self.sheep_list = [
                sheep for sheep in self.sheep_list if sheep['username'] != target
            ]

        elif self.compare_packet("Battle_Ping_Info"):
            current_packet = self.current_packet.object
            self.server_time = current_packet['latencyInfo']['serverSessionTime']
            packet = packetManager.get_packet_by_name('Battle_Ping_Sync')()
            packet.object['latencyInfo'] = {
                'clientTime': self.client_time,
                'serverSessionTime': self.server_time
            }
            packet.deimplement()
            self.send_packet(packet)

        elif self.compare_packet("Smoky_Shot_IN"):
            print("Smokey shot in: ", packet_data)

        elif self.compare_packet("Gold_Box_Drop_Text"):
            print("Gold box is dropping!")


    def start_battle_loop(self):
        self._task_thread = threading.Thread(target=self.battle_loop)
        self._task_thread.daemon = True
        self._task_thread.start()

    def battle_loop(self):
        while True:
            self.execute_battle_function()
            time.sleep(2)

    def execute_battle_function(self):
        if self.is_spawned is False:
            send_delay_spawn = packetManager.get_packet_by_name('Death_Delay_End')()
            self.send_packet(send_delay_spawn)

            time.sleep(3)

            send_spawn = packetManager.get_packet_by_name('Send_Respawn')()
            self.send_packet(send_spawn)

            time.sleep(5.5)

            send_end_respawn_packet = packetManager.get_packet_by_name('End_Resp_Fantom')()
            self.send_packet(send_end_respawn_packet)

            self.is_spawned = True

        if self.current_sheep is None:
            return
        current_team = self.current_sheep['team']
        opposite_team = 1 if current_team == 0 else 0

        opposite_sheeps = list(filter(lambda x: x['team'] == opposite_team, self.sheep_list))

        if len(opposite_sheeps) == 0:
            return
        
        opposite_sheep = random.choice(opposite_sheeps)

        if self.client_time is not None:
            pass
            send_smokey_out = packetManager.get_packet_by_name('Smoky_Shoot_Target_OUT')()
            send_smokey_out.object = {
                "clientTime": self.client_time,
                "target": opposite_sheep['username'],
                "incarnationID": 1,
                "localHitPoint": {'x': 0, 'y': 0, 'z': 0},
                "targetBodyPosition": opposite_sheep['position'],
                "globalHitPoint": opposite_sheep['position']
            }
            send_smokey_out.deimplement()
            self.send_packet(send_smokey_out)