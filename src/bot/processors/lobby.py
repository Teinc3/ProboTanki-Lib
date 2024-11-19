from threading import Thread

from .abstractprocessor import AbstractProcessor
from bot.enums import ProcessorCodes, ProcessorIDs
from lib.modules.packetmanager import packetManager
from lib.utils.scraper import StaffScraper


class LobbyProcessor(AbstractProcessor):
    processorID = ProcessorIDs.P_LOBBY

    mods_list: list[str]

    def __init__(self, holder):
        super().__init__(holder)
        
        # Enable watchdog thread
        if self.holder.watchdog:
            Thread(target=self.watchdog_thread).start()


    def process_packets(self):
        packet_object = self.current_packet.object

        if self.compare_packet('Online_Status'):
            if self.holder.watchdog:
                self.process_mod_online_status(packet_object['username'], packet_object['online'])
    
    def watchdog_thread(self):
        # Subscribe to mods online status, if not already subscribed
        if 'modsOnlineStatus' not in self.holder.storage:
            self.subscribe_mods()

        # while True:
        #     pass

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

        pass

    def process_mod_online_status(self, username: str, status: bool):
        if not 'modsOnlineStatus' in self.holder.storage or username not in self.mods_list:
            return
                
        mods_online_status = self.holder.storage['modsOnlineStatus']
        mod_count = len(self.mods_list)
        mods_online_status[username] = status

        if len(mods_online_status) != mod_count:
            return # Wait for data for all mods to arrive
        
        online_count = sum(mods_online_status.values())
        print(f"Mods Online: {online_count}/{mod_count} ({', '.join(mod_name for mod_name, is_online in mods_online_status.items() if is_online)})")

        if online_count >= 1:
            # Alter the behavior of watchdog
            pass