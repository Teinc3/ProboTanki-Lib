import struct
from bytearray import ByteArray
from threading import Lock

class Encryption:
    def __init__(self):
        self.lock = Lock()
        self.key_len = 8
        self.base = 0
        self.encryption_keys = [0] * self.key_len
        self.decryption_keys = [0] * self.key_len
        self.encrypt_position = 0
        self.decrypt_position = 0

    def decode_keys(self, packet: ByteArray):
        key_length = packet.read_int()
        keys = []
        for _ in range(key_length):
            key = packet.read_byte()
            keys.append(key)
        return keys
    
    def set_client_crypt_keys(self, keys: list):
        for key in keys:
            self.base ^= key
        
        for i in range(self.key_len):
            self.decryption_keys[i] = self.base ^ (i << 3)
            self.encryption_keys[i] = self.base ^ (i << 3) ^ 87
    
    def set_server_crypt_keys(self, keys: list):
        for key in keys:
            self.base ^= key
         
        for i in range(self.key_len):
            self.encryption_keys[i] = self.base ^ (i << 3)
            self.decryption_keys[i] = self.base ^ (i << 3) ^ 87

    def encrypt_packet(self, packet: ByteArray):
        encrypted_packet = ByteArray(packet)
        for i in range(len(encrypted_packet)):
            last_byte = encrypted_packet[i]
            encrypted_packet[i] = last_byte ^ self.encryption_keys[self.encrypt_position]
            self.encryption_keys[self.encrypt_position] = last_byte
            self.encrypt_position ^= last_byte & 7
        return encrypted_packet
    
    def decrypt_packet(self, packet: ByteArray):
        decrypted_packet = ByteArray(packet)
        for i in range(len(decrypted_packet)):
            last_byte = decrypted_packet[i]
            self.decryption_keys[self.decrypt_position] = last_byte ^ self.decryption_keys[self.decrypt_position]
            decrypted_packet[i] = self.decryption_keys[self.decrypt_position]
            self.decrypt_position ^= self.decryption_keys[self.decrypt_position] & 7
        return decrypted_packet