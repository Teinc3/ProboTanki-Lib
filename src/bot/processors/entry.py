from bot.enums import ProcessorCodes, ProcessorIDs
from lib.modules.packetmanager import packetManager
from .abstractprocessor import AbstractProcessor


class EntryProcessor(AbstractProcessor):
    processorID = ProcessorIDs.P_ENTRY

    def process_packets(self):
        packet_object = self.current_packet.object

        if self.compare_packet('Activate_Protection'):
            self.holder.protection.activate(packet_object['keys'])

        elif self.compare_packet('Set_Captcha_Keys'):
            client_lang_packet = packetManager.get_packet_by_name('Set_Client_Lang')()
            client_lang_packet.objects = ['en']
            self.send_packet(client_lang_packet)

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
        self.send_packet(login_packet)
