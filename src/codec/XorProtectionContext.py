from .EByteArray import EByteArray

class XorProtectionContext:
    ProtectionSize = 8

    def __init__(self):
        self.active = False
    
    def activate(self, packetByteArray: EByteArray) -> None:

        self.active = True

        self.c2s_vector = [0] * self.ProtectionSize
        self.s2c_vector = [0] * self.ProtectionSize
        self.c2s_index = 0
        self.s2c_index = 0
        self.xor_key = 0

        key_vector = self.extract_key(packetByteArray)

        for key_element in key_vector:
            self.xor_key ^= key_element

        for vector_index in range(self.ProtectionSize):
            self.s2c_vector[vector_index] = self.xor_key ^ (vector_index << 3)
            self.c2s_vector[vector_index] = self.xor_key ^ (vector_index << 3) ^ 0x57

        # Print the hash and vectors
        print("Hash: " + str(key_vector) + " | Encryption (Client to Server) Vector: " + str(self.c2s_vector) + " | Decryption (Server to Client) Vector: " + str(self.s2c_vector))

    def extract_key(self, packetByteArray: EByteArray) -> list[int]:
        # Read int to get how many bytes the key_vector has
        key_vector_size = int.from_bytes(packetByteArray[:4], signed=True)
        packetByteArray = packetByteArray[4:]

        # Read the key_vector
        key_vector: list[int] = []
        for i in range(key_vector_size):
            key_vector.append(packetByteArray[i])
        
        return key_vector
    
    def decrypt_server(self, data):
        data = EByteArray(data)
        for data_index in range(len(data)):
            encrypted_value = data[data_index]
            decrypted_value = encrypted_value ^ self.s2c_vector[self.s2c_index]
            data[data_index] = self.s2c_vector[self.s2c_index] = decrypted_value
            self.s2c_index ^= self.s2c_vector[self.s2c_index] & 7
        return data
    
    def decrypt_client(self, data):
        data = EByteArray(data)
        for data_index in range(len(data)):
            encrypted_value = data[data_index]
            decrypted_value = encrypted_value ^ self.c2s_vector[self.c2s_index]
            self.c2s_vector[self.c2s_index] = decrypted_value
            data[data_index] = decrypted_value
            self.c2s_index ^= decrypted_value & 7
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
        return data