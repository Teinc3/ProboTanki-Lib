import socks
from threading import Thread, Event
from typing import Callable

from ..security import Protection
from ..misc import packetManager
from ...packets import AbstractPacket
from ...utils import Address, EByteArray


class TankiSocket:
    ENDPOINT = Address("146.59.110.146", 1337)  # core-protanki.com

    def __init__(self,
                 protection: Protection, proxy: Address | None, emergency_halt: Event, 
                 on_data_received: Callable[[AbstractPacket], None], on_socket_close: Callable[[Exception | str, str, str], None],
                 socket: socks.socksocket = None
                 ):
        
        self.protection = protection

        self.proxy = proxy
        self.emergency_halt = emergency_halt

        self.on_data_received = on_data_received
        self.on_socket_close = on_socket_close

        if not socket:
            self.socket = socks.socksocket(socks.socket.AF_INET, socks.socket.SOCK_STREAM)
            self.socket.settimeout(15)
            if proxy:
                self.socket.set_proxy(socks.PROXY_TYPE_SOCKS5, proxy.host, proxy.port, username=proxy.username, password=proxy.password)
        else:
            self.socket = socket

        self.thread = Thread(target=self.loop, daemon=False) # So that the program does not halt abruptly
        self.thread.start()
    
    def connect(self):
        """Establish connection to endpoint"""
        try:
            # If already connected, then skip waiting for connection
            if self.socket.getpeername():
                return True
            self.socket.connect(self.ENDPOINT.split_args)
        except Exception as e:
            self.on_socket_close(e, "TankiSocket.connect", f"Not Connected | Proxy: {self.proxy}")
            return False
        return True
    
    def read_packet_header(self) -> tuple[int, int]:
        """Read packet header from socket"""

        packet_len = 0
        packet_id = 0

        packet_len_bytes = EByteArray(self.socket.recv(4))
        if len(packet_len_bytes) == 0:
            raise Exception("Socket Pipe Broken")
        
        packet_len = packet_len_bytes.read_int()
        packet_id_bytes = EByteArray(self.socket.recv(4))
        if len(packet_id_bytes) == 0:
            raise Exception("Socket Pipe Broken")
        packet_id = packet_id_bytes.read_int()

        return packet_len, packet_id
    
    def read_packet_data(self, data_len: int) -> EByteArray:
        """Loads chunked data into the socket buffer until we have all the data to read"""

        encrypted_data = EByteArray()

        while len(encrypted_data) != data_len:
            remaining_size = data_len - len(encrypted_data)
            received_data = EByteArray(self.socket.recv(remaining_size))

            if len(received_data) == 0:
                raise Exception("Socket Pipe Broken")
            encrypted_data += received_data

        return encrypted_data

    def process_packet(self, packet_id: int, encrypted_data: EByteArray):
        """Process received packet data"""  
        if packet_id == -1263520410:
            pass
        packet_data = self.protection.decrypt(encrypted_data)
        fitted_packet = self.packet_fitter(packet_id, packet_data)
        if 'Load' in fitted_packet.__class__.__name__ and 'Resources' not in fitted_packet.__class__.__name__ or fitted_packet.__class__.__name__ == 'Receive_Lobby_Chat':
            pass
        self.on_data_received(fitted_packet)

    def loop(self):
        if not self.connect():
            return
        
        while not self.emergency_halt.is_set():
            try:
                packet_len, packet_id = 0, 0
                packet_len, packet_id = self.read_packet_header()
                packet_data_len = packet_len - AbstractPacket.HEADER_LEN

                if packet_data_len > 0:
                    encrypted_data = self.read_packet_data(packet_data_len)
                else:
                    encrypted_data = EByteArray()

                self.process_packet(packet_id, encrypted_data)

            except Exception as e:
                state = f"Connected | Packet Length: {packet_len} | Packet ID: {packet_id}"
                self.on_socket_close(e, "TankiSocket.loop", state)
                break

        # When on_socket_close is called, the socket is closed before the halt is set and the loop breaks
        # So we don't have to do anything here

    def packet_fitter(self, packet_id: int, packet_data: EByteArray) -> AbstractPacket:
        Packet = packetManager.get_packet(packet_id)
        if Packet is None:
            packet = AbstractPacket()
            packet.id = packet_id
            packet.objects = [packet_data]
            packet.object = { 'data': packet_data }
            return packet

        current_packet = Packet()
        current_packet.unwrap(packet_data)
        return current_packet
    
    def close_socket(self):
        self.emergency_halt.set()
        self.socket.close()