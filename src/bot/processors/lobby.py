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
            self.holder.event_emitter.on('create_battle', self.create_battle)
            
            watchdog_thread = Thread(target=self.watchdog_thread)
            watchdog_thread.start()
            self.threads.add(watchdog_thread)

        else:
            # Set listener to auto select battle
            self.holder.event_emitter.on('sheep_join_battle', self.sheep_select_battle)

    def process_packets(self):
        packet_object = self.current_packet.object

        if self.compare_packet('Load_Account_Stats'):
            # Load Rank
            rank = self.holder.storage['credentials']['rank'] = packet_object['rank']
            crystals = self.holder.storage['credentials']['crystals'] = packet_object['crystals']
            print(f"{'Watchdog' if self.holder.watchdog else 'Sheep ' + str(self.holder.storage['sheep_id'])} Connected | Name: {packet_object['username']}, Rank: {rank}, Crystals: {crystals}")
            
            if not self.holder.watchdog and 'mounted_turret' not in self.holder.storage:
                # Go to garage, check if we have mounted railgun m0
                self.send_packet(self.packetManager.get_packet_by_name('Load_Garage')())

        elif self.compare_packet('Battle_Kick_Reason'):
            if 'inactive' in packet_object['reason']:
                print(f"{self.holder.storage['credentials']['username']} ({self.holder.storage['sheep_id']}) kicked for inactivity")
            else:
                print(f"{self.holder.storage['credentials']['username']} ({self.holder.storage['sheep_id']}) kicked for reason: {packet_object['reason']}")

        elif self.compare_packet('Online_Status'):
            if self.holder.watchdog:
                self.process_mod_status(packet_object['username'], status=packet_object['online'])

        elif self.compare_packet('In_Battle_Status'):
            if self.holder.watchdog:
                username = packet_object['battleNotifier']['username']
                battleID = "Private Battle" if packet_object['battleNotifier']['battleInfo']['private'] else packet_object['battleNotifier']['battleInfo']['battleID']
                self.process_mod_status(username ,battleID=battleID)

        elif self.compare_packet('Not_In_Battle_Status'):
            if self.holder.watchdog:
                self.process_mod_status(packet_object['username'], battleID='')

        elif self.compare_packet('Load_Battle_Info'):
            packet_object = packet_object['json']

            if not 'selected_battle' in self.holder.storage:
                return
            
            selected_battle = self.holder.storage['selected_battle']
            
            if self.holder.watchdog:
                selected_battle['battleID'] = packet_object['itemId']
                self.holder.event_emitter.emit('sheep_join_battle', self.holder.storage['selected_battle'].copy())
                print("New battle id:", packet_object['itemId'])

                # Invite human checker to battle
                # invite_packet = self.packetManager.get_packet_by_name('Send_Invite')()
                # invite_packet.object = {
                #     'username': "lEfkh9x5O9QOiGvAdbnM",
                #     'battleID': packet_object['itemId']
                # }
                # invite_packet.deimplement()
                
                # self.send_packet(invite_packet)
                return
            
            # Sheep selected the battle, its time to join this shit!
            if selected_battle['battleID'] != packet_object['itemId']:
                return
            join_packet = self.packetManager.get_packet_by_name('Join_Battle')()
            join_packet.objects = [2 if self.holder.storage['selected_battle']['battleMode'] == 0 else self.holder.storage['sheep_id'] % 2]

            # We don't quite have pro battle pass rn, so we buy it first before joining the battle
            if 'proBattleTimeLeftInSec' in packet_object and packet_object['proBattleTimeLeftInSec'] == -1:
                # Load garage
                self.holder.storage['buyProPass'] = True
                self.send_packet(self.packetManager.get_packet_by_name("Load_Garage")())
                
                self.create_timer(1, lambda: self.buy_pro_pass())
                
                self.create_packet_timer(2, self.packetManager.get_packet_by_name("Load_Lobby")())

                self.create_packet_timer(3, join_packet)

            else:
                self.send_packet(join_packet)

            # Remove this battle from storage, otherwise we might keep rejoining even after AC kicks us
            # del self.holder.storage['selected_battle']

        elif self.compare_packet("Round_Finish"):
            if not self.holder.watchdog:
                return
            
            return
                        
            if 'selected_battle' in self.holder.storage and 'battleID' in self.holder.storage['selected_battle']:
                if self.holder.storage['selected_battle']['battleID'] == packet_object['battleID']:
                    # Our battle has ended, create a new one
                    # Clear existing battle selection and emit battle creation
                    print("Battle ended, creating new battle...")
                    self.holder.storage.pop('selected_battle', None)
                    self.create_timer(10, lambda: self.holder.event_emitter.emit('emit_battle_creation'))

        elif self.compare_packet("Check_Item_Mounted"):

            if packet_object['item_id'] == "railgun_m0":
                self.holder.storage['mounted_turret'] = 'railgun_m0'
            elif packet_object['item_id'] == "smoky_m0":
                self.holder.storage['mounted_turret'] = 'smoky_m0'
            else:
                return
            
            # Reports sheep presence through emitter
            self.send_packet(self.packetManager.get_packet_by_name("Load_Lobby")())
            self.holder.event_emitter.emit('event_sheep_ready', self.holder.storage['sheep_id'], True)

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
        # All of these parameters must be the same for us to confirm the battle creation
        self.holder.storage['selected_battle'] = {
            'battleMode': data['battleMode']
        }
        
        create_packet = self.packetManager.get_packet_by_name('Create_Battle')()
        create_packet.object = {'autoBalance': data['autoBalance'], 'battleMode': data['battleMode'], 'format': 0,
                                'friendlyFire': False, 'battleLimits': {'scoreLimit': 0, 'timeLimit': data['timeLimit']},
                                'mapID': data['mapID'], 'maxPeopleCount': data['maxPeopleCount'], 'name': data['name'],
                                'parkourMode': False, 'privateBattle': data['privateBattle'], 'proBattle': data['proBattle'],
                                'rankRange': {'maxRank': data['rankRange'][1], 'minRank': data['rankRange'][0]}, 'noRearm': False, 'theme': 0,
                                'noSupplyBoxes': False, 'noCrystalBoxes': False, 'noSupplies': False, 'noUpgrade': False}

        create_packet.deimplement()
        self.send_packet(create_packet)

    def subscribe_mods(self):
        # Subscribe to mods online status
        mods_obj = self.holder.storage['mods_info'] = {
            'mods_status': {},
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

    # Offline, Online, BattleID
    def process_mod_status(self, username: str, status: bool = None, battleID: str = None):
        if not 'mods_info' in self.holder.storage:
            return

        mods_obj = self.holder.storage['mods_info']

        mods_status = mods_obj['mods_status']
        mod_count = len(mods_obj['mods_list'])
        if isinstance(status, bool):
            mods_status[username] = status
        elif isinstance(battleID, str):
            if mods_status[username] is True:
                if battleID == '':
                    mods_status[username] = True
                else:
                    mods_status[username] = battleID

        if len(mods_status) != mod_count:
            return  # Wait for data for all mods to arrive

        # Number of mods that are "idle" and may be moderating
        idle_count = sum(map(lambda x: int(x) if isinstance(x, bool) else 0, mods_status.values()))
        print(
            f"Mods Free to Moderate: {idle_count}/{mod_count} "
            f"({', '.join(mod_name for mod_name, is_online in mods_status.items() if is_online is True)})")

        changed = True

        if not mods_obj['all_mods_status_recv']:
            changed = False
            mods_obj['all_mods_status_recv'] = True
            # First time recv all actions (Can add return)
            self.holder.event_emitter.emit('watchdog_ready')

        # Second time recv all actions
        self.update_discord_status(changed, username)

    def load_garage(self):
        credentials = self.holder.storage['credentials']
        if 'buyProPass' in credentials and credentials['buyProPass']:
            return # As we should have done 

        if 'rank' in credentials:
            if credentials['rank'] >= 2 and credentials['railgun'] < 0:
                # Check if we have mounted
                self.buy_rail_kit()
            
            self.mount()
            self.mount('hunter_m0')


    def mount(self, item_id='railgun_m0'):
        mount_packet = self.packetManager.get_packet_by_name('Mount_Item')()
        mount_packet.object = {'item_id': item_id }
        mount_packet.deimplement()
        self.send_packet(mount_packet)

    def buy_pro_pass(self):
        buy_packet = self.packetManager.get_packet_by_name('Buy_Multiple_Items')()
        buy_packet.object = {'item_id': 'pro_battle_m0', 'count': 1, 'base_cost': 500}
        buy_packet.deimplement()
        self.send_packet(buy_packet)
        print(self.holder.storage['sheep_id'], "purchasing pro battle pass")

    def buy_rail_kit(self):
        buy_packet = self.packetManager.get_packet_by_name('Buy_Kit')()
        buy_packet.object = {'item_id': 'decree_m0', 'base_cost': 850}
        buy_packet.deimplement()
        self.send_packet(buy_packet)
        

    def update_discord_status(self, changed: bool, changed_mod_name: str):
        return
        endpoint = "https://discord.com/api/webhooks/1314034164680364065/e1v8MfC5P9eJXY9k0LmLsMh-K4tbXyMupPKYy0lW-X0kzSSZJdpeORjC7gKOsvgMq6N1"
        data = {
            'embeds': [{
                'title': 'Mods Online Status',
                'description': 'List of mods that are currently online in game',
                'fields': [{
                    'name': mod_name + (" (Changed)" if changed and changed_mod_name else ""),
                    'value': ("In battle: " + status) if isinstance(status, str) else 'Online',
                    'inline': True
                } for mod_name, status in self.holder.storage['mods_info']['mods_status'].items()
                if status],
                'footer': {
                    'text': 'Mods Online: ' + str(sum(map(lambda x: int(bool(x)), self.holder.storage['mods_info']['mods_status'].values()))) + '/' + str(len(self.holder.storage['mods_info']['mods_list']))
                }
            }]
        }

        post(endpoint, json=data)