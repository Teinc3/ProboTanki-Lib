import socks
from threading import Thread, Event
from typing import Callable
import time
import zlib

from ..security import CProtection
from ..misc import packetManager
from ...packets import AbstractPacket
from ...utils import Address, EByteArray


class TankiSocket:
    ENDPOINT = Address("146.59.110.146", 25565)  # core-protanki.com

    def __init__(
        self,
        protection: CProtection,
        proxy: Address | None,
        emergency_halt: Event, 
        on_data_received: Callable[[AbstractPacket], None],
        on_socket_close: Callable[[Exception | str, str, str, bool, bool, bool], None],
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
        """Establish connection to endpoint with retry and backoff"""

        max_retries = 3
        retry_delay = 2  # Start with 2 seconds
        
        for attempt in range(max_retries):
            try:
                # If already connected, skip reconnection
                if self.socket.getpeername():
                    return True
                    
                # Create a new socket for each attempt to avoid stale resources
                if attempt > 0:
                    self.socket.close()
                    self.socket = socks.socksocket(socks.socket.AF_INET, socks.socket.SOCK_STREAM)
                    self.socket.settimeout(15)
                    if self.proxy:
                        self.socket.set_proxy(socks.PROXY_TYPE_SOCKS5, 
                                             self.proxy.host, self.proxy.port,
                                             username=self.proxy.username, 
                                             password=self.proxy.password)
                
                self.socket.connect(self.ENDPOINT.split_args)
                return True
                
            except (socks.ProxyConnectionError, TimeoutError, socks.GeneralProxyError) as e:
                # Proxy timeout - use exponential backoff
                if attempt < max_retries - 1:
                    backoff_time = retry_delay * (2 ** attempt)
                    time.sleep(backoff_time)

                else:
                    self.on_socket_close(e, "TankiSocket.connect", f"Not Connected | Proxy: {self.proxy}")
                    return False
                
            except Exception as e:
                self.on_socket_close(e, "TankiSocket.connect", f"Not Connected | Proxy: {self.proxy}")
                
        return False

    def read_packet_header(self) -> tuple[int, int, bool]:
        """Read packet header from socket"""

        packet_len = 0
        packet_id = 0

        header_bytes = EByteArray(self.socket.recv(4))
        if len(header_bytes) == 0:
            raise Exception("Socket Pipe Broken")
        header_data = header_bytes.read_int()

        is_compressed = ((header_data >> 24) & 0x40) != 0
        packet_len = header_data & 0x00FFFFFF

        packet_id_bytes = EByteArray(self.socket.recv(4))
        if len(packet_id_bytes) == 0:
            raise Exception("Socket Pipe Broken")
        packet_id = packet_id_bytes.read_int()

        return packet_len, packet_id, is_compressed
    
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

    def process_packet(self, packet_id: int, encrypted_data: EByteArray, is_compressed: bool):
        """Process received packet data"""  

        packet_data = self.protection.decrypt(bytearray(encrypted_data))
        if is_compressed:
            packet_data = zlib.decompress(packet_data, wbits=-zlib.MAX_WBITS)
        fitted_packet = self.packet_fitter(packet_id, EByteArray(packet_data))
        self.on_data_received(fitted_packet)

    def loop(self):
        if not self.connect():
            return
        
        while not self.emergency_halt.is_set():
            try:
                packet_len, packet_id = 0, 0
                packet_len, packet_id, is_compressed = self.read_packet_header()
                packet_data_len = packet_len - AbstractPacket.HEADER_LEN

                if packet_data_len > 0:
                    encrypted_data = self.read_packet_data(packet_data_len)
                else:
                    encrypted_data = EByteArray()

                self.process_packet(packet_id, encrypted_data, is_compressed)

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