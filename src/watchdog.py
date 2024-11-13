import socket as Socket

from modules.packetmanager import packetManager
from modules.protection import Protection
from packets import AbstractPacket

from utils.address import Address
from utils.ebytearray import EByteArray


class WatchDog:
    TARGET_ADDRESS = Address("146.59.110.146", 1337)  # core-protanki.com
    
    protection: Protection
    socket: Socket.socket

    username: str
    password: str

    def __init__(self, username: str, password: str):
        self.protection = Protection()
        self.socket = Socket.socket(Socket.AF_INET, Socket.SOCK_STREAM)

        self.username = username
        self.password = password

        # Connect to server
        self.socket.connect(self.TARGET_ADDRESS.split_args)
        self.loop()

    def loop(self):
        socx = self.socket
        
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

                packet_data = self.protection.decrypt(encrypted_data)
                self.parse_packet(packet_id, EByteArray(packet_data))

            except Exception as e:
                print(e)
                exit()

    def parse_packet(self, packet_id: int, packet_data: EByteArray):
        Packet = packetManager.get_packet(packet_id)
        if Packet is None:
            return
        
        packet = Packet()
        packet_len = len(packet_data)
        data = packet.unwrap(packet_data)

        print(f"{Packet.__name__} [{packet_len}]: {str(data)[0:min(300, len(str(data)))]}")

        if packetManager.get_packet_by_name('Activate_Protection') == Packet:
            self.protection.activate(data['keys'])
            
        elif packetManager.get_packet_by_name('Ping') == Packet:
            pong_packet = packetManager.get_packet_by_name('Pong')()
            self.socket.sendall(pong_packet.wrap(self.protection))
        
        elif packetManager.get_packet_by_name('Set_Captcha_Keys') == Packet:
            client_lang_packet = packetManager.get_packet_by_name('Set_Client_Lang')()
            client_lang_packet.objects = ['en']
            self.socket.sendall(client_lang_packet.wrap(self.protection))

        elif packetManager.get_packet_by_name('Load_Resources') == Packet:
            loaded_packet = packetManager.get_packet_by_name('Resources_Loaded')()
            loaded_packet.objects = [data['callbackID']] # Lazy deimplement
            self.socket.sendall(loaded_packet.wrap(self.protection))

        elif packetManager.get_packet_by_name('Login_Ready') == Packet:
            self.login()
        
    def login(self):
        login_data = {
            "username": self.username,
            "password": self.password,
            "rememberMe": False
        }
        login_packet = packetManager.get_packet_by_name('Login')()
        login_packet.deimplement(login_data)
        packet_data = login_packet.wrap(self.protection)
        self.socket.sendall(packet_data)

if __name__ == "__main__":
    WatchDog("SavageReaper623", "QzeDyzEBF1CF")