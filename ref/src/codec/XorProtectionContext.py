from Logger import Logger
from codec.EByteArray import EByteArray


def extract_key(packetByteArray: EByteArray) -> list[int]:
    # Read int to get how many bytes the key_vector has
    key_vector_size = int.from_bytes(packetByteArray[:4], signed=True)
    packetByteArray = packetByteArray[4:]

    # Read the key_vector
    key_vector: list[int] = []
    for i in range(key_vector_size):
        key_vector.append(packetByteArray[i])

    return key_vector


class XorProtectionContext:
    ProtectionSize = 8

    def __init__(self):
        self.xor_key = None
        self.s2c_index = None
        self.c2s_index = None
        self.s2c_vector = None
        self.c2s_vector = None
        self.active = False
        self.logger = Logger()

    def activate(self, packetByteArray: EByteArray) -> None:

        self.active = True

        self.c2s_vector = [0] * self.ProtectionSize
        self.s2c_vector = [0] * self.ProtectionSize
        self.c2s_index = 0
        self.s2c_index = 0
        self.xor_key = 0

        key_vector = extract_key(packetByteArray)

        for key_element in key_vector:
            self.xor_key ^= key_element

        for vector_index in range(self.ProtectionSize):
            self.s2c_vector[vector_index] = self.xor_key ^ (vector_index << 3)
            self.c2s_vector[vector_index] = self.xor_key ^ (vector_index << 3) ^ 0x57

        # Log the hash and vectors
        self.logger.log_info(
            f"Hash: {key_vector} | Encryption (Client to Server) Vector: {self.c2s_vector} | "
            f"Decryption (Server to Client) Vector: {self.s2c_vector}",
            True
        )

    def decrypt_server(self, data):
        data = EByteArray(data)
        for data_index in range(len(data)):
            encrypted_value = data[data_index]
            decrypted_value = encrypted_value ^ self.s2c_vector[self.s2c_index]
            data[data_index] = self.s2c_vector[self.s2c_index] = decrypted_value
            self.s2c_index ^= self.s2c_vector[self.s2c_index] & 7

        self.logger.log_info(f"S2C Vector: {self.s2c_vector} | S2C Index: {self.s2c_index}")
        return data

    def decrypt_client(self, data):
        data = EByteArray(data)
        for data_index in range(len(data)):
            encrypted_value = data[data_index]
            decrypted_value = encrypted_value ^ self.c2s_vector[self.c2s_index]
            self.c2s_vector[self.c2s_index] = decrypted_value
            data[data_index] = decrypted_value
            self.c2s_index ^= decrypted_value & 7

        self.logger.log_info(f"C2S Vector: {self.c2s_vector} | C2S Index: {self.c2s_index}")
        return data

    def decrypt(self, data, direction):
        return data if not self.active else self.decrypt_server(data) if direction else self.decrypt_client(data)

    def encrypt(self, data):
        if not self.active:
            return data

        data = EByteArray(data)
        for data_index in range(len(data)):
            unencrypted_value = data[data_index]
            encrypted_value = unencrypted_value ^ self.c2s_vector[self.c2s_index]
            data[data_index] = encrypted_value
            self.c2s_vector[self.c2s_index] = unencrypted_value
            self.c2s_index ^= unencrypted_value & 7

        self.logger.log_info(f"C2S Vector: {self.c2s_vector} | C2S Index: {self.c2s_index}")
        return data
