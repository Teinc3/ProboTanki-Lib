from requests import post
from threading import Thread

from bot.enums import ProcessorCodes, ProcessorIDs
from lib.utils.web import StaffScraper
from .abstractprocessor import AbstractProcessor


class LobbyProcessor(AbstractProcessor):
    processorID = ProcessorIDs.P_LOBBY

    def __init__(self, holder):
        super().__init__(holder)

        if self.holder.watchdog:  # Enable watchdog thread
            self.holder.event_emitter.on('all_sheep_ready', self.create_battle)
            Thread(target=self.watchdog_thread).start()

        else:  # Reports sheep presence through emitter
            self.holder.event_emitter.emit('sheep_ready', self.holder.storage['sheep_id'], True)

            # Set listener to auto select battle
            self.holder.event_emitter.on('sheep_join_battle', self.sheep_select_battle)

    def process_packets(self):
        packet_object = self.current_packet.object

        if self.compare_packet('Load_Account_Stats'):
            # Load Rank
            self.holder.storage['credentials']['rank'] = packet_object['rank']
            print(f"{'Watchdog' if self.holder.watchdog else 'Sheep ' + str(self.holder.storage['sheep_id'])} Connected: ", self.holder.storage['credentials'], self.holder.storage['proxy'])

        elif self.compare_packet('Online_Status'):
            if self.holder.watchdog:
                self.process_mod_online_status(packet_object['username'], packet_object['online'])

        elif self.compare_packet('Battle_Created'):
            # Not useful for now
            pass

        elif self.compare_packet('Select_Battle'):
            if 'selected_battle' not in self.holder.storage:
                return
            if self.holder.watchdog:
                # There is a possibility that the battle was not created by the watchdog but selected by the server
                # We will figure out a way later
                # Server autoselects the newly created battle for us
                self.holder.storage['selected_battle']['battleID'] = packet_object['battleID']
                self.holder.event_emitter.emit('sheep_join_battle', self.holder.storage['selected_battle'].copy())
            # For sheep, we use Load_Battle_Info instead

        elif self.compare_packet('Load_Battle_Info'):
            packet_object = packet_object['json']

            if self.holder.watchdog or not 'selected_battle' in self.holder.storage:
                return
            
            # Sheep selected the battle, its time to join this shit!
            if self.holder.storage['selected_battle']['battleID'] != packet_object['itemId']:
                return
            join_packet = self.packetManager.get_packet_by_name('Join_Battle')()
            join_packet.objects = [2 if self.holder.storage['selected_battle']['battleMode'] == 0 else self.holder.storage['sheep_id'] % 2]

            # We don't quite have pro battle pass rn, so we buy it first before joining the battle
            if 'proBattleTimeLeftInSec' in packet_object and packet_object['proBattleTimeLeftInSec'] == -1:
                self.buy_pro_pass()
                self.create_timer(1, join_packet) # 1 second margin

            else:
                self.send_packet(join_packet)

            # Remove this battle from storage, otherwise we might keep rejoining even after AC kicks us
            del self.holder.storage['selected_battle']

    def watchdog_thread(self):
        # Subscribe to mods online status, if not already subscribed
        if 'mods_info' not in self.holder.storage:
            self.subscribe_mods()

    def manual_select_battle(self):
        if not 'selected_battle' in self.holder.storage or not 'battleID' in self.holder.storage['selected_battle']:
            print("Could not find selected battle")

        select_packet = self.packetManager.get_packet_by_name('Select_Battle')()
        select_packet.objects = [self.holder.storage['selected_battle']['battleID']]
        self.send_packet(select_packet)
    
    def sheep_select_battle(self, battleInfo: dict):
        if self.holder.watchdog:
            return
        self.holder.storage['selected_battle'] = battleInfo
        self.manual_select_battle()

    def create_battle(self, data: dict):        
        self.holder.storage['selected_battle'] = {
            'battleMode': data['battleMode'],
        }
        
        create_packet = self.packetManager.get_packet_by_name('Create_Battle')()
        create_packet.object = {'autoBalance': False, 'battleMode': data['battleMode'], 'format': 0,
                                'friendlyFire': False, 'battleLimits': {'scoreLimit': 0, 'timeLimit': 90},
                                'mapID': data['mapID'], 'maxPeopleCount': data['maxPeopleCount'], 'name': data['name'],
                                'parkourMode': False, 'privateBattle': False, 'proBattle': True,
                                'rankRange': {'maxRank': 3, 'minRank': 1}, 'noRearm': False, 'theme': 0,
                                'noSupplyBoxes': False, 'noCrystalBoxes': False, 'noSupplies': False, 'noUpgrade': False}

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

        Subscribe_Packet = self.packetManager.get_packet_by_name('Subscribe_Status')
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
            return  # Wait for data for all mods to arrive

        online_count = sum(mods_online_status.values())
        print(
            f"Mods Online: {online_count}/{mod_count} "
            f"({', '.join(mod_name for mod_name, is_online in mods_online_status.items() if is_online)})")

        if not mods_obj['all_mods_status_recv']:
            mods_obj['all_mods_status_recv'] = True
            # First time recv all actions (Can add return)
            self.holder.event_emitter.emit('watchdog_ready')

        # Second time recv all actions
        # self.update_discord_status()

    def buy_pro_pass(self):
        buy_packet = self.packetManager.get_packet_by_name('Buy_Multiple_Items')()
        buy_packet.object = {'item_id': 'pro_battle_m0', 'count': 1, 'base_cost': 500}
        buy_packet.deimplement()
        self.send_packet(buy_packet)
        print(self.holder.storage['sheep_id'], "purchasing pro battle pass")

    def update_discord_status(self):
        endpoint = "https://discord.com/api/webhooks/1309907418573963394/2FQsU_MKCXL5R01dmWERhZxpTrU4sehANFSG5F19PiHC3kMmINgjFNXLRAi3gPS93090"
        data = {
            'embeds': [{
                'title': 'Mods Online Status',
                'description': 'List of mods that are currently online in game',
                'fields': [{
                    'name': mod_name,
                    'value': 'Online',
                    'inline': True
                } for mod_name, online_status in self.holder.storage['mods_info']['mods_online_status'].items()
                if online_status],
                'footer': {
                    'text': 'Mods Online: ' + str(sum(self.holder.storage['mods_info']['mods_online_status'].values())) + '/' + str(len(self.holder.storage['mods_info']['mods_list']))
                }
            }]
        }

        post(endpoint, json=data)