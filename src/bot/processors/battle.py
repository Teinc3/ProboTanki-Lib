import threading
import time
from bot.enums import ProcessorIDs
from lib.modules import packetManager
from .abstractprocessor import AbstractProcessor
import datetime as date


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
        self._client_time += int(10 * elapsed_time)
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

            self.sheep_list.append({
                'username': username,
                'team': team,
                'position': position
            })

            self.current_sheep = {
                'username': username,
                'team': team,
                'position': position
            }

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
            print("Battle ping info: ", packet_data, self.client_time, self.server_time)

        elif self.compare_packet("Smokey_Shot_In"):
            print("Smokey shot in: ", packet_data)


    def start_battle_loop(self):
        self._task_thread = threading.Thread(target=self.battle_loop)
        self._task_thread.daemon = True
        self._task_thread.start()

    def battle_loop(self):
        while True:
            self.execute_battle_function()
            time.sleep(1.848)

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

        opposite_sheep = next(
            (sheep for sheep in self.sheep_list if sheep['team'] == opposite_team),
            None
        )

        if opposite_sheep is None:
            return

        if self.client_time is not None:
            pass
            # print(self.sheep_list, self.holder.storage)
            # send_smokey_out = packetManager.get_packet_by_name('Smokey_Shot_OUT')()
            # send_smokey_out.object['clientTime'] = self.client_time
            # send_smokey_out.object['hitPoint'] = opposite_sheep['position']
            # send_smokey_out.deimplement()
            # self.send_packet(send_smokey_out)