from threading import Thread

from .abstractprocessor import AbstractProcessor
from bot.enums import ProcessorCodes, ProcessorIDs
from lib.modules.packetmanager import packetManager
from lib.utils.web import StaffScraper


class LobbyProcessor(AbstractProcessor):
    processorID = ProcessorIDs.P_LOBBY

    mods_list: list[str]

    def __init__(self, holder):
        super().__init__(holder)
        
        # Enable watchdog thread
        if self.holder.watchdog:
            Thread(target=self.watchdog_thread).start()
        else: # Sheep, select the required battle
            self.select_battle()

    def process_packets(self):
        packet_object = self.current_packet.object

        if self.compare_packet('Load_Account_Stats'):
            # Load Rank
            self.holder.storage['credentials']['rank'] = packet_object['rank']
            print(self.holder.storage['credentials'])

        elif self.compare_packet('Online_Status'):
            if self.holder.watchdog:
                self.process_mod_online_status(packet_object['username'], packet_object['online'])

        elif self.compare_packet('Battle_Created'):
            if 'json' not in packet_object or not packet_object['json']:
                return
            packet_object = packet_object['json']

            # Since this is json, the values we get from server are slightly different than what we have in our codebase
            if self.holder.watchdog and 'battleId' in packet_object and 'maxPeople' in packet_object:
                self.holder.storage['selected_battle'] = {
                    'maxPeopleCount': packet_object['maxPeople'],
                    'battleID': packet_object['battleId']
                }

        elif self.compare_packet('Select_Battle'):
            if 'selected_battle' not in self.holder.storage:
                return
            if packet_object['battleID'] == self.holder.storage['selected_battle']['battleID']:
                if self.holder.watchdog:
                    self.holder.event_emitter.emit('main_battle_created', self.holder.storage['selected_battle'])
                else:
                    # Sheep joins the battle
                    packet = packetManager.get_packet_by_name('Join_Battle')()
                    packet.objects = [2]
                    self.holder.socket.sendall(packet.wrap(self.holder.protection))

        elif self.compare_packet('Load_Battle_Info'):
            packet_object = packet_object['json']

            if 'proBattleTimeLeftInSec' in packet_object and packet_object['proBattleTimeLeftInSec'] == -1:
                self.buy_pro_pass()
                print("Pro Pass bought successfully for:", self.holder.storage['credentials']['username'])

    def watchdog_thread(self):
        # Subscribe to mods online status, if not already subscribed
        if 'modsOnlineStatus' not in self.holder.storage:
            self.subscribe_mods()

    def subscribe_mods(self):
        # Subscribe to mods online status
        self.holder.storage['modsOnlineStatus'] = {}

        self.mods_list = StaffScraper().get_names()
        if len(self.mods_list) == 0:
            self.holder.close_socket(ProcessorCodes.STAFF_SCRAPER_ERROR)

        self.current_packet_class = packetManager.get_packet_by_name('Subscribe_Status')
        for mod_name in self.mods_list:
            self.current_packet = self.current_packet_class()
            self.current_packet.objects = [mod_name]
            self.holder.socket.send(self.current_packet.wrap(self.holder.protection))

    def select_battle(self):
        if not 'selected_battle' in self.holder.storage or 'battleID' not in self.holder.storage['selected_battle']:
            print("Could not find selected battle")

        packet = packetManager.get_packet_by_name('Select_Battle')()
        packet.objects = [self.holder.storage['selected_battle']['battleID']]
        self.holder.socket.sendall(packet.wrap(self.holder.protection))

    def create_battle(self):
        packet = packetManager.get_packet_by_name('Create_Battle')()
        packet.object = {'autoBalance': True, 'battleMode': 0, 'format': 0, 'friendlyFire': False, 'battleLimits': {'scoreLimit': 0, 'timeLimit': 900}, 'mapID': 'map_serpuhov', 'maxPeopleCount': 20, 'name': 'Serpuhov DM', 'parkourMode': False, 'privateBattle': False, 'proBattle': False, 'rankRange': {'maxRank': 7, 'minRank': 1}, 'rearm': False, 'theme': 0, 'noSupplyBoxes': False, 'noCrystalBoxes': False, 'noSupplies': False, 'noUpgrade': False}
        packet.deimplement()
        self.holder.socket.sendall(packet.wrap(self.holder.protection))    

    def process_mod_online_status(self, username: str, status: bool):
        if not 'modsOnlineStatus' in self.holder.storage or username not in self.mods_list:
            return
        
        self.holder.storage['allModsStatusReceived'] = False
                
        mods_online_status = self.holder.storage['modsOnlineStatus']
        mod_count = len(self.mods_list)
        mods_online_status[username] = status

        if len(mods_online_status) != mod_count:
            return # Wait for data for all mods to arrive
        
        online_count = sum(mods_online_status.values())
        print(f"Mods Online: {online_count}/{mod_count} ({', '.join(mod_name for mod_name, is_online in mods_online_status.items() if is_online)})")

        if not self.holder.storage['allModsStatusReceived']:
            self.holder.storage['allModsStatusReceived'] = True
            self.create_battle()

    def buy_pro_pass(self):
        packet = packetManager.get_packet_by_name('Buy_Multiple_Items')()
        packet.object = {'item_id': 'pro_battle_m0', 'count': 1, 'base_cost': 500}
        packet.deimplement()
        self.holder.socket.sendall(packet.wrap(self.holder.protection))
