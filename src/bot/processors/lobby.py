from threading import Thread

from .abstractprocessor import AbstractProcessor
from bot.enums import ProcessorCodes, ProcessorIDs
from lib.modules.packetmanager import packetManager
from lib.utils.web import StaffScraper


class LobbyProcessor(AbstractProcessor):
    processorID = ProcessorIDs.P_LOBBY

    def __init__(self, holder):
        super().__init__(holder)
        
        # Enable watchdog thread
        if self.holder.watchdog:
            Thread(target=self.watchdog_thread).start()
            # Set some events
            self.holder.event_emitter.on('sheep_join_battle', self.sheep_select_battle)
            self.holder.event_emitter.on('all_sheep_ready', self.create_battle)
        else: # Reports sheep presence through emitter
            self.holder.event_emitter.emit('sheep_ready', self.holder.storage['sheep_id'], True)

    def process_packets(self):
        packet_object = self.current_packet.object

        if self.compare_packet('Load_Account_Stats'):
            # Load Rank
            self.holder.storage['credentials']['rank'] = packet_object['rank']
            print("Account Connected: ", self.holder.storage['credentials'])

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
                    self.holder.event_emitter.emit('sheep_join_battle', self.holder.storage['selected_battle'])
                else:
                    # Sheep joins the battle
                    join_packet = packetManager.get_packet_by_name('Join_Battle')()
                    join_packet.objects = [2]
                    self.send_packet(join_packet)

        elif self.compare_packet('Load_Battle_Info'):
            packet_object = packet_object['json']

            if 'proBattleTimeLeftInSec' in packet_object and packet_object['proBattleTimeLeftInSec'] == -1:
                self.buy_pro_pass()
                print("Pro Pass bought successfully for:", self.holder.storage['credentials']['username'])

    def watchdog_thread(self):
        # Subscribe to mods online status, if not already subscribed
        if 'mods_info' not in self.holder.storage:
            self.subscribe_mods()

    def select_battle(self):
        if not 'selected_battle' in self.holder.storage or 'battleID' not in self.holder.storage['selected_battle']:
            print("Could not find selected battle")

        select_packet = packetManager.get_packet_by_name('Select_Battle')()
        select_packet.objects = [self.holder.storage['selected_battle']['battleID']]
        self.send_packet(select_packet)
    
    def sheep_select_battle(self, data: dict):
        self.holder.storage['selected_battle'] = data
        self.select_battle()

    def create_battle(self, data: dict):
        create_packet = packetManager.get_packet_by_name('Create_Battle')()
        create_packet.object = {'autoBalance': True, 'battleMode': data['battleMode'], 'format': 0, 'friendlyFire': False, 'battleLimits': {'scoreLimit': 0, 'timeLimit': 900}, 'mapID': data['mapID'], 'maxPeopleCount': data['maxPeopleCount'], 'name': data['name'], 'parkourMode': False, 'privateBattle': False, 'proBattle': False, 'rankRange': {'maxRank': 7, 'minRank': 1}, 'rearm': False, 'theme': 0, 'noSupplyBoxes': False, 'noCrystalBoxes': False, 'noSupplies': False, 'noUpgrade': False}
        create_packet.deimplement()
        self.send_packet(create_packet)    

    def subscribe_mods(self):
        # Subscribe to mods online status
        mods_obj = self.holder.storage['mods_info'] = {
            'mods_online_status': {},
            'mods_list': StaffScraper().get_names(),
            'all_mods_status_recv': False
        }

        if len(mods_obj['mods_list']) == 0:
            self.holder.close_socket(ProcessorCodes.STAFF_SCRAPER_ERROR)

        Subscribe_Packet = packetManager.get_packet_by_name('Subscribe_Status')
        for mod_name in mods_obj['mods_list']:
            packet = Subscribe_Packet()
            packet.objects = [mod_name]
            self.holder.socket.send(packet.wrap(self.holder.protection))

    def process_mod_online_status(self, username: str, status: bool):
        if not 'mods_info' in self.holder.storage:
            return
        
        mods_obj = self.holder.storage['mods_info']
                
        mods_online_status = mods_obj['mods_online_status']
        mod_count = len(mods_obj['mods_list'])
        mods_online_status[username] = status

        if len(mods_online_status) != mod_count:
            return # Wait for data for all mods to arrive
        
        online_count = sum(mods_online_status.values())
        print(f"Mods Online: {online_count}/{mod_count} ({', '.join(mod_name for mod_name, is_online in mods_online_status.items() if is_online)})")

        if not mods_obj['all_mods_status_recv']:
            mods_obj['all_mods_status_recv'] = True
            # First time recv all actions (Can add return)

        # Second time recv all actions

    def buy_pro_pass(self):
        buy_packet = packetManager.get_packet_by_name('Buy_Multiple_Items')()
        buy_packet.object = {'item_id': 'pro_battle_m0', 'count': 1, 'base_cost': 500}
        buy_packet.deimplement()
        self.send_packet(buy_packet)
