import socket
from threading import Thread
import struct
from modules.logger import logger
from modules.processor import Processor
from crypto.codec.ebytearray import EByteArray
from holders.protectionHolder import ProtectionHolder
from holders.socketHolder import SocketHolder
from holders.addressHolder import Address


class TankiProxy:
    PROXY_ADDRESS = Address("127.0.0.1", 1337)
    TARGET_ADDRESS = Address("146.59.110.146", 1337)  # core-protanki.com

    MAX_CONNECTIONS = 1

    protections: ProtectionHolder
    processor: Processor
    sockets: SocketHolder

    def __init__(self, proc: Processor):
        self.processor = proc
        self.protections = proc.protections
        self.sockets = proc.sockets

        self.start_client_proxy()

    def handle_client(self):
        """C2S: Client -> Proxy -> Server"""

        socx = self.sockets.client
        while True:
            try:
                packet_len = EByteArray(socx.recv(4)).read_int()
                packet_id = EByteArray(socx.recv(4)).read_int()

                abspacket_data_len = packet_len - Processor.HEADER_LEN
                encrypted_data = EByteArray()

                if abspacket_data_len > 0:
                    # Load chunked data into the socket buffer until we have all the data to read
                    while len(encrypted_data) != abspacket_data_len:
                        remaining_size = abspacket_data_len - len(encrypted_data)
                        received_data = EByteArray(socx.recv(remaining_size))
                        if len(received_data) == 0:
                            raise Exception("Client Disconnected")
                        encrypted_data += received_data

                packet_data = self.protections.c2s.decrypt(encrypted_data)
                self.processor.parse_outbound(packet_len, packet_id, EByteArray(packet_data))

                # Note: when forwarding, we have to re-encrypt the data
                forwarded_data = self.protections.c2s.encrypt(packet_data)
                self.forward(False, packet_len, packet_id, forwarded_data)

            except struct.error:
                logger.log_error("Client socket aborted")
                self.end()
            except Exception as e:
                logger.log_error("Client socket error: ", e)
                self.end()

    def handle_server(self):
        """S2C: Server -> Proxy -> Client"""

        socx = self.sockets.server
        while True:
            try:
                packet_len = EByteArray(socx.recv(4)).read_int()
                packet_id = EByteArray(socx.recv(4)).read_int()

                abspacket_data_len = packet_len - Processor.HEADER_LEN
                encrypted_data = EByteArray()

                if abspacket_data_len > 0:
                    while len(encrypted_data) != abspacket_data_len:
                        remaining_size = abspacket_data_len - len(encrypted_data)
                        received_data = EByteArray(socx.recv(remaining_size))
                        if len(received_data) == 0:
                            raise Exception("Server Disconnected")
                        encrypted_data += received_data

                packet_data = self.protections.s2c.decrypt(encrypted_data)
                self.processor.parse_inbound(packet_len, packet_id, EByteArray(packet_data))

                self.forward(True, packet_len, packet_id, encrypted_data)

            except struct.error:
                logger.log_error("Server socket aborted")
                self.end()
            except Exception as e:
                logger.log_error("Server socket error: ", e)
                self.end()

    def forward(self, direction: bool, packet_len: int, packet_id: int, encrypted_data: EByteArray):
        """Forwards an encrypted but full packet over"""

        full_packet = (EByteArray()
                       .write_int(packet_len)
                       .write_int(packet_id)
                       .write(bytes(encrypted_data)))
        # print(f"Forwarding {'IN' if direction else 'OUT'} [{packet_len}]: ID: {packet_id} | "
        #       f"Data: {encrypted_data.trim()}")

        # As IN is true, if true we forward to client, else we forward to server
        (self.sockets.client if direction else self.sockets.server).sendall(full_packet)

        # debug_packet_len = full_packet.read_int()
        # debug_packet_id = full_packet.read_int()

        # if direction:
        #     debug_data = self.protections.debug_s2c.decrypt(full_packet)
        # else:
        #     debug_data = self.protections.debug_c2s.decrypt(full_packet)

        # print(f"DEBUG FORWARDED {'IN' if direction else 'OUT'} [{debug_packet_len}]: ID: {debug_packet_id} | "
        #       f"Data: {debug_data.trim()}")

    def start_server_socket(self):
        """Starts a socket to connect to the target server"""

        try:
            self.sockets.server.settimeout(10)
            self.sockets.server.connect((TankiProxy.TARGET_ADDRESS.host, TankiProxy.TARGET_ADDRESS.port))

            logger.log_info("Connected to Target Server", True)
            Thread(target=self.handle_server).start()

        except socket.timeout:
            logger.log_error("Server Connection Timeout")
            self.end()
        except socket.error as e:
            logger.log_error("Server Connection Error: ", e)
            self.end()

    def start_client_proxy(self):
        """Starts a server to listen for the client to connect to us"""

        local_proxy = socket.socket()
        local_proxy.bind(TankiProxy.PROXY_ADDRESS.split_args)
        logger.log_info("Proxy Server Started", True)
        local_proxy.listen(TankiProxy.MAX_CONNECTIONS)

        self.sockets.client, _ = local_proxy.accept()
        logger.log_info("Client Connected", True)
        self.start_server_socket()

        Thread(target=self.handle_client).start()

    def end(self):
        self.sockets.close()
        exit(0)


if __name__ == "__main__":
    sockets = SocketHolder()
    protections = ProtectionHolder()
    processor = Processor(sockets, protections)
    TankiProxy(processor)
