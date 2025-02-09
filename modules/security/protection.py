from ...utils import EByteArray


class Protection:
    vector_length = 8

    active: bool
    flip_direction: bool

    base: int
    decryption_vector: list[int]
    encryption_vector: list[int]
    decryption_index: int
    encryption_index: int

    def __init__(self, flip_direction: bool = False) -> None:
        self.active = False
        self.flip_direction = flip_direction

        self.base = 0
        self.decryption_vector = [0] * self.vector_length
        self.encryption_vector = [0] * self.vector_length
        self.decryption_index = 0
        self.encryption_index = 0

    def activate(self, keys: list[int]):
        for key in keys:
            self.base ^= key

        for i in range(self.vector_length):
            base_xor = self.base ^ (i << 3)
            self.decryption_vector[i] = base_xor ^ (0x0 if not self.flip_direction else 0x57)
            self.encryption_vector[i] = base_xor ^ (0x57 if not self.flip_direction else 0x0)

        self.active = True

    def decrypt(self, encrypted_data: EByteArray):
        """
        Decrypts encrypted data using the decryption vector

        Does not mutate the original (encrypted) data
        """

        if not self.active:
            return encrypted_data
        
        data = EByteArray(encrypted_data)

        for i in range(len(encrypted_data)):
            encrypted_byte = encrypted_data[i]
            self.decryption_vector[self.decryption_index] = (
                    encrypted_byte ^ self.decryption_vector[self.decryption_index])
            data[i] = self.decryption_vector[self.decryption_index]
            self.decryption_index ^= self.decryption_vector[self.decryption_index] & 7

        return data

    def encrypt(self, raw_data: EByteArray):
        """
        Encrypts raw data using the encryption vector

        Does not mutate the original (raw) data
        """

        if not self.active:
            return raw_data
        
        encrypted_data = EByteArray(raw_data)

        for i in range(len(raw_data)):
            raw_byte = raw_data[i]
            encrypted_data[i] = raw_byte ^ self.encryption_vector[self.encryption_index]
            self.encryption_vector[self.encryption_index] = raw_byte
            self.encryption_index ^= raw_byte & 7

        return encrypted_data
