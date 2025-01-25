import socks
from threading import Thread, Event
from typing import Callable

from lib.modules import Protection, packetManager
from lib.packets import AbstractPacket
from lib.utils import Address, EByteArray


class TankiSocket:
    ENDPOINT = Address("146.59.110.146", 1337)  # core-protanki.com

    def __init__(self,
                 protection: Protection, proxy: Address | None, emergency_halt: Event, 
                 on_data_received: Callable[[AbstractPacket], None], on_socket_close: Callable[[Exception], None]
                 ):
        
        self.protection = protection

        self.proxy = proxy
        self.emergency_halt = emergency_halt

        self.on_data_received = on_data_received
        self.on_socket_close = on_socket_close

        self.socket = socks.socksocket(socks.socket.AF_INET, socks.socket.SOCK_STREAM)
        self.socket.set_proxy(socks.PROXY_TYPE_SOCKS5, proxy.host, proxy.port, username=proxy.username, password=proxy.password) if proxy else None

        self.thread = Thread(target=self.loop, daemon=False) # So that the program does not halt abruptly
        self.thread.start()

    def loop(self):
        try:
            self.socket.connect(self.ENDPOINT.split_args)
        except socks.GeneralProxyError as e:
            self.on_socket_close(e)
            return
        except socks.SOCKS5AuthError as e:
            self.on_socket_close(e)
            return
        except socks.SOCKS5Error as e:
            self.on_socket_close(e)
            return
        except Exception as e:
            self.on_socket_close(e)
            return
        
        while not self.emergency_halt.is_set():
            try:
                packet_len = 0
                packet_id = 0

                packet_len_bytes = EByteArray(self.socket.recv(4))
                if len(packet_len_bytes) == 0:
                    raise Exception("Pipe broken")
                
                packet_len = packet_len_bytes.read_int()
                packet_id_bytes = EByteArray(self.socket.recv(4))
                if len(packet_id_bytes) == 0:
                    raise Exception("Pipe broken")
                packet_id = packet_id_bytes.read_int()

                packet_data_len = packet_len - AbstractPacket.HEADER_LEN
                encrypted_data = EByteArray()

                if packet_data_len > 0:
                    # Load chunked data into the socket buffer until we have all the data to read
                    while len(encrypted_data) != packet_data_len:
                        remaining_size = packet_data_len - len(encrypted_data)
                        received_data = EByteArray(self.socket.recv(remaining_size))
                        if len(received_data) == 0:
                            raise Exception("Pipe broken")
                        encrypted_data += received_data

                packet_data = self.protection.decrypt(encrypted_data)
                fitted_packet = self.packet_fitter(packet_id, packet_data)
                self.on_data_received(fitted_packet)

            except Exception as e:
                self.on_socket_close(e)
                break

        # When on_socket_close is called, the socket is closed before the halt is set and the loop breaks
        # So we don't have to do anything here

    def packet_fitter(self, packet_id: int, packet_data: EByteArray) -> AbstractPacket:
        Packet = packetManager.get_packet(packet_id)
        if Packet is None:
            packet = AbstractPacket()
            packet.object = { 'data': packet_data }
            return packet

        current_packet = Packet()
        current_packet.unwrap(packet_data)
        return current_packet