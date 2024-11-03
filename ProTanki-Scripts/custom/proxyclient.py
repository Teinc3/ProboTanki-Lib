import socket
from encryption import Encryption
from bytearray import ByteArray
from python_socks.sync import Proxy
from queue import Queue
from threading import Thread
import logging
from packets import PACKETS
from time import sleep

class ProxyClient:
    TIMEOUT = 10

    def __init__(self, dest_ip: str, dest_port: int, proxy: str = None):
        self.dest_ip = dest_ip
        self.dest_port = dest_port
        self.proxy = proxy
        self.encryption = Encryption()
        self.__packets_queue = Queue()
        self.__disconnecting = False

    def __receive_loop(self):
        while not self.__disconnecting:
            try:
                # Читаем длину пакета (int - размер 4 байта)
                raw_packet_len = ByteArray(self.__s.recv(4))

                # Читаем ID пакета (int - размер 4 байта)
                raw_packet_id = ByteArray(self.__s.recv(4))
                if not raw_packet_len or not raw_packet_id or len(raw_packet_len) == 0 or len(raw_packet_id) == 0:
                    logging.error("Disconnected..")
                    self.disconnect()
                    break
                # Длина пакета
                packet_len = raw_packet_len.read_int()

                # Айди пакета
                packet_id = raw_packet_id.read_int()
                
                # Смотрим есть ли данные у пакета
                available_size = packet_len - self.encryption.key_len
                logging.debug(f"Received {packet_id} avialable data: {available_size}")

                data = ByteArray()

                # получаем данные поблочно
                while len(data) != available_size:
                    receive_size = available_size - len(data)
                    received_data = ByteArray(self.__s.recv(receive_size))
                    data += received_data
                
                # Не декриптим, если это пакет установки ключей (не зашифрован)
                if packet_id == PACKETS.SET_CRYPT_KEYS:
                    self.__packets_queue.put((packet_id, data))
                    # Костыль, но похуй, баг заключался в том, 
                    # что данные расшифровываются раньше в другом потоке, чем 
                    # успевают устанавливаться ключи
                    # Возможный фикс - перенести логику установки ключей прямо сюда,
                    # но тогда возникают проблемы с отслеживанием пакетов и методами из другого потока (метод handshake)
                    sleep(1)
                    continue

                # Ping - pong
                if packet_id == PACKETS.PING:
                    self.send_packet(PACKETS.PONG)
                    continue

                # декриптим каждый пакет
                decrypted_data = self.encryption.decrypt_packet(data)

                # Автозагрузка ресурсов
                if packet_id == PACKETS.LOAD_RESOURCES:
                    decrypted_data.read_utf()
                    resources_id = decrypted_data.read_int()
                    resources_loaded_packet = ByteArray().write_int(resources_id)
                    self.send_packet(PACKETS.RESOURCES_LOADED, resources_loaded_packet)
                    logging.debug(f"Loaded resources with ID={resources_id}")
                    continue
                
                # Отправляем пакет в очередь для приема
                self.__packets_queue.put((packet_id, decrypted_data))
            except Exception as ex:
                pass

    def send_packet(self, packet_id, packet_data = ByteArray()):
        enc_packet = self.encryption.encrypt_packet(packet_data)
        # Заголовки: Длина пакета | ID пакета | Данные
        full_packet = (ByteArray().write_int(len(enc_packet) + self.encryption.key_len)
                                  .write_int(packet_id)
                                  .write(enc_packet))
        self.__s.sendall(full_packet)
        logging.debug(f"Sent {packet_id}")

    def receive_data(self, packet_id = None, timeout = None) -> tuple[int, ByteArray]:
        timeout = timeout if timeout else self.TIMEOUT
        pack_id, pack_data = self.__packets_queue.get(timeout=timeout)
        if not packet_id or pack_id == packet_id:
            return (pack_id, pack_data)
        return self.receive_data(packet_id, timeout)

    def handshake(self):
        try:
            if self.proxy:
                proxy = Proxy.from_url(self.proxy)
                self.__s = proxy.connect(dest_host=self.dest_ip, dest_port=self.dest_port)
            else:
                self.__s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                self.__s.connect((self.dest_ip, self.dest_port))
            logging.debug(f"Connected to {self.dest_ip}:{self.dest_port}")
            self.__s.settimeout(self.TIMEOUT)
            receive_thread = Thread(target=self.__receive_loop)
            receive_thread.start()
            _, packet_data = self.receive_data(PACKETS.SET_CRYPT_KEYS)
            keys = self.encryption.decode_keys(packet_data)
            logging.debug(f"Received crypt keys {keys}")
            self.encryption.set_client_crypt_keys(keys)
            logging.info("Succesfully handhaked!")
        except Exception as ex:
            self.disconnect()
            logging.error(ex)
            raise ex
    
    def auth(self, login, password):
        try:
            login_packet = (ByteArray().write_utf(login)
                                       .write_utf(password)
                                       .write_boolean(False))
            self.send_packet(PACKETS.LOGIN, login_packet)
            while True:
                packet_id, _ = self.receive_data()
                if packet_id == PACKETS.LOGIN_SUCCESS:
                    logging.info(f"Succesfully logged in as {login}")
                    return True
                elif packet_id == PACKETS.INVALID_CREDENTIAL:
                    raise Exception("Invalid credentials!")
        except Exception as ex:
            logging.error(ex)
            return False

    def disconnect(self):
        self.__s.close()
        self.__disconnecting = True