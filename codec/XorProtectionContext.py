class XorProtectionContext:
    ProtectionSize = 8

    def __init__(self):
        self.active = False
    
    def activate(self, packetByteArray: bytearray) -> None:

        self.active = True

        self.encryption_vector = [0] * self.ProtectionSize
        self.decryption_vector = [0] * self.ProtectionSize
        self.encryption_index = 0
        self.decryption_index = 0
        self.xor_key = 0

        key_vector = self.extract_key(packetByteArray)

        for key_element in key_vector:
            self.xor_key ^= key_element

        for vector_index in range(self.ProtectionSize):
            self.decryption_vector[vector_index] = self.xor_key ^ (vector_index << 3)
            self.encryption_vector[vector_index] = self.xor_key ^ (vector_index << 3) ^ 0x57

        # Print the hash and vectors
        print("Hash: " + str(key_vector) + " | Encryption Vector: " + str(self.encryption_vector) + " | Decryption Vector: " + str(self.decryption_vector))

    def extract_key(self, packetByteArray: bytearray) -> list[int]:
        # Read int to get how many bytes the key_vector has
        key_vector_size = int.from_bytes(packetByteArray[:4], signed=True)
        packetByteArray = packetByteArray[4:]

        # Read the key_vector
        key_vector: list[int] = []
        for i in range(key_vector_size):
            key_vector.append(packetByteArray[i])
        
        return key_vector

    def encrypt(self, data):
        data = bytearray(data)
        for data_index in range(len(data)):
            byte_value = data[data_index]
            data[data_index] = byte_value ^ self.encryption_vector[self.encryption_index]
            self.encryption_vector[self.encryption_index] = byte_value
            self.encryption_index ^= byte_value & 7
        return data

    def decrypt(self, data):
        data = bytearray(data)
        for data_index in range(len(data)):
            byte_value = data[data_index]
            self.decryption_vector[self.decryption_index] = byte_value ^ self.decryption_vector[self.decryption_index]
            data[data_index] = self.decryption_vector[self.decryption_index]
            self.decryption_index ^= self.decryption_vector[self.decryption_index] & 7
        return data