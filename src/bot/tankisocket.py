import os
import sys
import socket as Socket

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
    TARGET_ADDRESS = Address("146.59.110.146", 1337)  # core-protanki.com

    def __init__(self, username: str, password: str, watchdog: bool = False):

        self.holder = CallbackHolder(
            protection = Protection(),
            socket = Socket.socket(Socket.AF_INET, Socket.SOCK_STREAM), 
            storage = {
                'credentials': {
                    'username': username,
                    'password': password
                }
            },
            swap_processor = self.swap_processor,
            close_socket = self.close_socket,
            watchdog = watchdog
        )

        self.processor = processors.EntryProcessor(self.holder)

        # Connect to server
        self.holder.socket.connect(self.TARGET_ADDRESS.split_args)
        self.loop()

    def loop(self):
        socx = self.holder.socket
        
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
                self.close_socket(ProcessorCodes.SOCKET_ERROR)
                print(f"Error: {e}")

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
    TankiSocket("SavageReaper623", "QzeDyzEBF1CF", True)