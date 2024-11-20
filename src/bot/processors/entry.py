from .abstractprocessor import AbstractProcessor
from bot.enums import ProcessorCodes, ProcessorIDs
from lib.modules.packetmanager import packetManager


class EntryProcessor(AbstractProcessor):
    processorID = ProcessorIDs.P_ENTRY

    def process_packets(self):
        packet_object = self.current_packet.object

        if self.compare_packet('Activate_Protection'):
            self.holder.protection.activate(packet_object['keys'])
            
        elif self.compare_packet('Ping'):
            pong_packet = packetManager.get_packet_by_name('Pong')()
            self.holder.socket.sendall(pong_packet.wrap(self.holder.protection))
        
        elif self.compare_packet('Set_Captcha_Keys'):
            client_lang_packet = packetManager.get_packet_by_name('Set_Client_Lang')()
            client_lang_packet.objects = ['en']
            self.holder.socket.sendall(client_lang_packet.wrap(self.holder.protection))

        elif self.compare_packet('Load_Resources'):
            loaded_packet = packetManager.get_packet_by_name('Resources_Loaded')()
            loaded_packet.objects = [packet_object['callbackID']] # Lazy deimplement
            self.holder.socket.sendall(loaded_packet.wrap(self.holder.protection))

        elif self.compare_packet('Invite_Code_Status'):
            if packet_object['inviteEnabled']:
                self.holder.close_socket(ProcessorCodes.INVITE_CODE_REQUIRED)

        elif self.compare_packet('Login_Ready'):
            self.login()

        elif self.compare_packet('Login_Success'):
            self.holder.swap_processor(ProcessorIDs.P_LOBBY)

        elif self.compare_packet('Login_Failed'):
            self.holder.close_socket(ProcessorCodes.WRONG_CREDENTIALS)

    def login(self):
        if 'credentials' not in self.holder.storage:
            self.holder.close_socket(ProcessorCodes.WRONG_CREDENTIALS)
        
        # Prune everything except username and password and add rememberMe False
        credentials: dict = self.holder.storage['credentials'].copy()
        login_data = {
            'username': credentials['username'],
            'password': credentials['password'],
            'rememberMe': False
        }

        login_packet = packetManager.get_packet_by_name('Login')()
        login_packet.deimplement(login_data)
        packet_data = login_packet.wrap(self.holder.protection)
        self.holder.socket.sendall(packet_data)