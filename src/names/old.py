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
words_path = os.path.join(data_path, 'eng_news_2023_10K-words-stemmed.txt')


class Allocator:
    """
    Allocates Batch of Names to a Socket
    """

    BATCH_SIZE = 20

    def __init__(self, name_list: list[str]):
        self.name_list = name_list
        self.get_lock = Lock()

        self.checkouts = 0

        self.available_names = set()
        self.unavailable_names = set()
        self.set_lock = Lock()

    def get_names(self):
        with self.get_lock:
            list_len = len(self.name_list)
            if list_len > 0:
                return [self.name_list.pop(0) for _ in range(min(self.BATCH_SIZE, list_len)) if self.name_list]
            return []
        
    def refund_names(self, names: list[str]):
        """If a proxy fails and the socket closes, refund unqueried names back to the allocator"""
        with self.set_lock:
            self.name_list.extend(names)
    
    def checkout(self, available: set[str], unavailable: set[str], unused: list[str] = [], forced=False):
        with self.set_lock:
            self.checkouts += 1
            self.available_names.update(available)
            self.unavailable_names.update(unavailable)

            if forced or self.checkouts % 100 == 0:
                print(f"Total checkouts: {self.checkouts} | Available: {len(self.available_names)} | Total Unavailable: {len(self.unavailable_names)}")
                # Write all available names to file (OK to overwrite existing file)
                with open(os.path.join(data_path, 'names_available.txt'), 'w') as f:
                    f.write('\n'.join(self.available_names))

            if len(unused) > 0:
                self.name_list.extend(unused)


class NameSocket:
    ENDPOINT = Address("146.59.110.146", 1337)  # core-protanki.com

    last_processed_packet: AbstractPacket

    def __init__(self, id: int, proxy: Address, allocator: Allocator, stop_event: Event):
        self.id = id

        self.stop_event = stop_event
        self.stop_event.clear()

        self.name_batch: list[str] = [] # Receive names in batches of 20
        self.name_queue = queue.Queue()
        self.socket_ready = False

        self.names_available = set()
        self.names_unavailable = set()

        self.protection = Protection()
        self.proxy = proxy
        self.socket = socks.socksocket(socks.socket.AF_INET, socks.socket.SOCK_STREAM)
        self.socket.set_proxy(socks.PROXY_TYPE_SOCKS5, proxy.host, proxy.port, username=proxy.username, password=proxy.password)

        self.allocator = allocator

        Thread(target=self.loop, daemon=False).start()

    def loop(self):
        try:
            self.socket.connect(self.ENDPOINT.split_args)
        except Exception as e:
            print(f"{self.id} Proxy Error: {e} | {self.proxy}")
            return

        while not self.stop_event.is_set():
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
                    while not self.stop_event.is_set() and len(encrypted_data) != packet_data_len:
                        remaining_size = packet_data_len - len(encrypted_data)
                        received_data = EByteArray(self.socket.recv(remaining_size))
                        if len(received_data) == 0:
                            raise Exception("Disconnected")
                        encrypted_data += received_data

                packet_data = self.protection.decrypt(encrypted_data)
                self.parse_packet(packet_id, EByteArray(packet_data))

            except Exception as e:
                print(f"{self.id} Error: {e} | {packet_len} {packet_id}")
                self.checkout(True, True)
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
            self.start_check_next_name()
            Thread(target=self.process_name_queue, daemon=True).start()

        elif self.compare_packet("Name_Available"):
            self.name_availability(True)

        elif self.compare_packet("Name_Unavailable"):
            self.name_availability(False)

    def name_availability(self, is_available: bool):
        name = self.name_batch.pop(0)
        if is_available:
            self.names_available.add(name)
        else:
            self.names_unavailable.add(name)

        if len(self.names_available) + len(self.names_unavailable) >= 20:
            self.checkout(False, False) # Periodically checkout names to allocator

        self.start_check_next_name()

    def start_check_next_name(self):
        if len(self.name_batch) == 0:
            self.name_batch.extend(self.allocator.get_names())

            if len(self.name_batch) == 0:
                # Checkout our name results to the allocator
                self.checkout(False, True)
                return

        name = self.name_batch[0]
        self.name_queue.put(name)

    def process_name_queue(self):
        while not self.stop_event.is_set():
            try:
                name = self.name_queue.get(timeout=1)
                packet = packetManager.get_packet_by_name("Check_Name_Availability")()
                packet.objects = [name]
                self.socket.sendall(packet.wrap(self.protection))

                time.sleep(1)
                self.name_queue.task_done()

            except queue.Empty:
                # Waiting for next name to be put into queue by start_check_next_name()
                # Essentially same as time.sleep(1)
                continue
            except Exception as e:
                print(f"{self.id} Error: {e}")
                self.checkout(True, True)
                return

    def checkout(self, forced = False, close_socket = True):
        self.allocator.checkout(self.names_available, self.names_unavailable, self.name_batch)
        
        if forced:
            print(f"{self.id} Forcibly checked out {len(self.names_available)} available and {len(self.names_unavailable)} unavailable names")

        if close_socket:
            self.socket.close()

    def compare_packet(self, packet_name: str):
        return self.last_processed_packet.__class__.__name__ == packet_name

        
if __name__ == "__main__":
    with open(words_path, 'r') as f:
        words = f.read().splitlines()

        print(f"Loaded {len(words)} Words.")

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

    allocator = Allocator(words)
    sockets: set[NameSocket] = set()
    stop_event = Event()

    for i, proxy in enumerate(proxies):
        sockets.add(NameSocket(i, proxy, allocator, stop_event))

    try:
        while True:
            time.sleep(0.2)
    except KeyboardInterrupt:
        print("Exiting...")
        stop_event.set()
        for socket in sockets:
            socket.checkout(True)
        allocator.checkout(set(), set(), [], True)
        print("All Sockets Closed.")
