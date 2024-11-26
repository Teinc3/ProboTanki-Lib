import threading
import time
from bot.enums import ProcessorIDs
from lib.modules import packetManager
from .abstractprocessor import AbstractProcessor

class BattleProcessor(AbstractProcessor):
    processorID = ProcessorIDs.P_BATTLE

    def __init__(self, holder):
        super().__init__(holder)
        
        self.current_sheep = None
        self.client_time = None
        self.sheep_list = []

        self.start_battle_loop()

    def start_battle_loop(self):
        self._task_thread = threading.Thread(target=self.battle_loop)
        self._task_thread.daemon = True
        self._task_thread.start()

    def battle_loop(self):
        while True:
            self.execute_battle_function()
            time.sleep(1.848)

    def execute_battle_function(self):
        if self.current_sheep is None:
            return
        current_team = self.current_sheep['team']
        opposite_team = 1 if current_team == 2 else 2

        opposite_sheep = next(
            (sheep for sheep in self.sheep_list if sheep['team'] == opposite_team),
            None
        )

        if opposite_sheep is None:
            return
        
        send_smokey_out = packetManager.get_packet_by_name('Smokey_Shot_OUT')()
        send_smokey_out.object['clientTime'] = self.client_time
        send_smokey_out.object['hitPoint'] = opposite_sheep['position']
        send_smokey_out.deimplement()
        send_smokey_out.sockets.server.sendall(send_smokey_out.wrap())

    def process_packets(self):
        packet_data = self.current_packet.object

        if self.compare_packet("Start_Resp_Fantom"):
            print(self.holder.storage['sheep_id'], "Fantom started", str(packet_data))
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

        elif self.compare_packet("Battle_Ping_Sync"):
            self.client_time = packet_data['latencyInfo']['clientTime']