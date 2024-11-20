import os
import sys
import socks
from threading import Thread

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))) # To access src/
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'lib'))) # To access modules within src/lib/

from lib.modules.protection import Protection
from lib.packets import AbstractPacket
from lib.utils.address import Address
from lib.utils.ebytearray import EByteArray

import processors
from enums import ProcessorCodes, ProcessorIDs
from callbackholder import CallbackHolder


class TankiSocket:
    PROXY_USERNAME = "dvkiyjwt"
    PROXY_PASSWORD = "qm1jlakn7pfy"
    TARGET_ADDRESS = Address("146.59.110.146", 1337)  # core-protanki.com

    def __init__(self, holder: CallbackHolder):

        self.holder = holder
        self.holder.protection = Protection()
        self.holder.socket = socks.socksocket(socks.socket.AF_INET, socks.socket.SOCK_STREAM)
        # Check if credentials come with Proxy and Port
        credentials = self.holder.storage['credentials']
        if 'proxy' in credentials and 'port' in credentials:
            self.holder.socket.set_proxy(socks.PROXY_TYPE_SOCKS5, credentials['proxy'], credentials['port'], username=self.PROXY_USERNAME, password=self.PROXY_PASSWORD)

        self.holder.swap_processor = self.swap_processor
        self.holder.close_socket = self.close_socket

        self.processor = processors.EntryProcessor(self.holder)

        # Connect to server
        Thread(target=self.loop).start()

    def loop(self):
        socx = self.holder.socket
        socx.connect(self.TARGET_ADDRESS.split_args)

        
        while True:
            try:
                packet_len = EByteArray(socx.recv(4)).read_int()
                packet_id = EByteArray(socx.recv(4)).read_int()

                packet_data_len = packet_len - AbstractPacket.HEADER_LEN
                encrypted_data = EByteArray()

                if packet_data_len > 0:
                    # Load chunked data into the socket buffer until we have all the data to read
                    while len(encrypted_data) != packet_data_len:
                        remaining_size = packet_data_len - len(encrypted_data)
                        received_data = EByteArray(socx.recv(remaining_size))
                        if len(received_data) == 0:
                            raise Exception("Client Disconnected")
                        encrypted_data += received_data

                packet_data = self.holder.protection.decrypt(encrypted_data)
                self.processor.parse_packets(packet_id, EByteArray(packet_data))

            except Exception as e:
                print(f"Error: {e}")
                self.close_socket(ProcessorCodes.SOCKET_ERROR)

    def swap_processor(self, p_id: ProcessorIDs):
        def enum_compare(processor: processors.AbstractProcessor):
            return repr(processor.processorID) == repr(p_id)
        
        if enum_compare(processors.EntryProcessor):
            self.processor = processors.EntryProcessor(self.holder)
        elif enum_compare(processors.LobbyProcessor):
            self.processor = processors.LobbyProcessor(self.holder)
        elif enum_compare(processors.BattleProcessor):
            self.processor = processors.BattleProcessor(self.holder)
        pass

    def close_socket(self, code: ProcessorCodes):
        print(f"Socket closed: {code}")
        self.holder.socket.close()
        sys.exit(0)

if __name__ == "__main__":

    TankiSocket(CallbackHolder(
        storage = { "credentials": { "username": "SavageReaper623", "password": "QzeDyzEBF1CF" } },
        watchdog = True
    ))