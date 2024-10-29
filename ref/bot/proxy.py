import socket
from threading import Thread, Lock
from encryption import Encryption
from bytearray import ByteArray

LOCAL_HOST = "127.0.0.1"
LOCAL_PORT = 1337
LOCAL_BIND_PORT = 7331

TARGET_HOST = "146.59.110.146" # core-protanki.com
TARGET_PORT = 1337


server_enc = Encryption()
client_enc = Encryption()

target_server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
local_client: socket.socket = None

def send_to_client(packet_id, packet = ByteArray(), encrypt = True):
    if encrypt:
        enc_packet = server_enc.encrypt_packet(packet)
        full_packet = (ByteArray().write_int(len(enc_packet) + server_enc.key_len)
                                  .write_int(packet_id)
                                  .write(enc_packet))
    else:
        full_packet = (ByteArray().write_int(len(packet) + server_enc.key_len)
                                  .write_int(packet_id)
                                  .write(packet))
    local_client.sendall(full_packet)

def send_to_server(packet_id, packet = ByteArray()):
    enc_packet = client_enc.encrypt_packet(packet)
    full_packet = (ByteArray().write_int(len(enc_packet) + client_enc.key_len)
                              .write_int(packet_id)
                              .write(enc_packet))
    target_server.sendall(full_packet)

def handle_client():
    while True:
        raw_packet_len = ByteArray(local_client.recv(4))
        raw_packet_id = ByteArray(local_client.recv(4))
        if not raw_packet_len or not raw_packet_id or len(raw_packet_len) == 0 or len(raw_packet_id) == 0:
            print("Client disconnected..")
            target_server.close()
            break
        packet_len = raw_packet_len.read_int()
        packet_id = raw_packet_id.read_int()
        available_size = packet_len - server_enc.key_len
        data = ByteArray()
        if available_size > 0:
            while len(data) != available_size:
                receive_size = available_size - len(data)
                received_data = ByteArray(local_client.recv(receive_size))
                data += received_data
        # pong packet
        if packet_id == 1484572481:
            send_to_server(packet_id)
            continue
        packet_data = server_enc.decrypt_packet(data)
        print("[client --> server] Forwarded ", packet_id, "->", packet_data)
        send_to_server(packet_id, packet_data)

def handle_server():
    while True:
        raw_packet_len = ByteArray(target_server.recv(4))
        raw_packet_id = ByteArray(target_server.recv(4))
        if not raw_packet_len or not raw_packet_id or len(raw_packet_len) == 0 or len(raw_packet_id) == 0:
            print("Server disconnected..")
            local_client.close()
            break
        packet_len = raw_packet_len.read_int()
        packet_id = raw_packet_id.read_int()
        available_size = packet_len - client_enc.key_len
        data = ByteArray()
        if available_size > 0:
            while len(data) != available_size:
                receive_size = available_size - len(data)
                received_data = ByteArray(target_server.recv(receive_size))
                data += received_data
        # ping packet
        if packet_id == -555602629:
            send_to_client(packet_id)
            continue
        elif packet_id == 2001736388:
            keys = client_enc.decode_keys(data)
            print("Received keys:", keys)
            client_enc.set_client_crypt_keys(keys)
            server_enc.set_server_crypt_keys(keys)
            enc_packet = ByteArray().write_int(len(keys))
            for key in keys:
                enc_packet.write_byte(key)
            send_to_client(packet_id, enc_packet, False)
        else:
            packet_data = client_enc.decrypt_packet(data)
            print("[server --> client] Forwarded", packet_id, "->", packet_data)
            send_to_client(packet_id,packet_data)

def start_local_serv():
    global local_client
    local_server = socket.socket()
    local_server.bind((LOCAL_HOST, LOCAL_PORT))
    local_server.listen(1)
    local_client, addr = local_server.accept()
    print("connection: ", addr)
    client_handler = Thread(target=handle_client)
    client_handler.start()

def start_target_client():
    global target_server
    target_server.settimeout(10)
    target_server.bind((LOCAL_HOST, LOCAL_BIND_PORT))
    target_server.connect((TARGET_HOST, TARGET_PORT))
    server_handler = Thread(target=handle_server)
    server_handler.start()

start_local_serv()
start_target_client()