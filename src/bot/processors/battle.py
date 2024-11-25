import threading
import time
from bot.enums import ProcessorIDs
from lib.modules import packetManager
from .abstractprocessor import AbstractProcessor

global_sheep_list = []


def _task_function():
    global global_sheep_list

    if BattleProcessor.current_sheep is not None:
        current_team = BattleProcessor.current_sheep['team']
        opposite_team = 1 if current_team == 2 else 2

        opposite_sheep = next((sheep for sheep in global_sheep_list if sheep['team'] == opposite_team), None)

        if opposite_sheep is not None:
            send_smokey_out = packetManager.get_packet_by_name('Smokey_Shot_OUT')()
            send_smokey_out.object['clientTime'] = BattleProcessor.client_time
            send_smokey_out.object['hitPoint'] = opposite_sheep['position']
            send_smokey_out.deimplement()
            send_smokey_out.sockets.server.sendall(send_smokey_out.wrap())


def _periodic_task():
    while True:
        _task_function()
        time.sleep(1.848)


class BattleProcessor(AbstractProcessor):
    processorID = ProcessorIDs.P_BATTLE
    current_sheep = None
    client_time = None

    def __init__(self):
        super().__init__()
        self._start_periodic_task()

    def _start_periodic_task(self):
        self._task_thread = threading.Thread(target=_periodic_task)
        self._task_thread.daemon = True
        self._task_thread.start()

    def process_packets(self):
        packet_data = self.current_packet.object

        if self.compare_packet("Start_Resp_Fantom"):
            username = packet_data['username']
            team = packet_data['team']
            position = packet_data['position']

            global global_sheep_list
            global_sheep_list.append({
                'username': username,
                'team': team,
                'position': position
            })

            self.current_sheep = {
                'username': username,
                'team': team,
                'position': position
            }

        if self.compare_packet("Kill_Confirm"):
            target = packet_data['target']

            global global_sheep_list
            global_sheep_list = [sheep for sheep in global_sheep_list if sheep['username'] != target]

        if self.compare_packet("Battle_Ping_Sync"):
            self.client_time = packet_data['latencyInfo']['clientTime']
