DEF VECTOR_LEN = 8


cdef class CProtection:
    cdef bint active
    cdef bint flip_direction

    cdef unsigned char base
    cdef unsigned char[VECTOR_LEN] decryption_vector
    cdef unsigned char[VECTOR_LEN] encryption_vector
    cdef Py_ssize_t decryption_index
    cdef Py_ssize_t encryption_index

    def __init__(self, bint flip_direction = False) -> None:
        self.active = False
        self.flip_direction = flip_direction
        self.base = 0

        cdef Py_ssize_t i
        for i in range(VECTOR_LEN):
            self.decryption_vector[i] = 0
            self.encryption_vector[i] = 0

        self.decryption_index = 0
        self.encryption_index = 0

    cpdef activate(self, keys: list[int]):
        """
        Activate protection using a list of bytes.
        Computes a base by XOR-ing each key, then fills the encryption/decryption vectors.
        """

        cdef Py_ssize_t i
        cdef unsigned char key, base_xor
        cdef int key_int

        for key_int in keys:
            self.base ^= (key_int & 0xFF)

        for i in range(VECTOR_LEN):
            base_xor = self.base ^ (<unsigned char>(i << 3))
            if not self.flip_direction:
                # When flip_direction is False, decryption vector uses base_xor directly,
                # and encryption vector XORs base_xor with 0x57.
                self.decryption_vector[i] = base_xor
                self.encryption_vector[i] = base_xor ^ 0x57
            else:
                # Otherwise, the roles are reversed.
                self.decryption_vector[i] = base_xor ^ 0x57
                self.encryption_vector[i] = base_xor
        self.active = True

    cpdef bytearray decrypt(self, bytearray encrypted_data):
        """
        Decrypt the encrypted_data using the internal decryption vector.
        This method does not modify encrypted_data, but returns a new bytearray.
        """

        cdef Py_ssize_t i, data_len
        cdef unsigned char encrypted_byte, dec_val

        if not self.active:
            return encrypted_data

        # Create a copy of encrypted_data using bytearray (built-in type, optimized)
        cdef bytearray data = bytearray(encrypted_data)
        data_len = len(data)

        # Cache attributes 
        cdef Py_ssize_t dec_idx = self.decryption_index
        cdef unsigned char* dec_vec = self.decryption_vector

        for i in range(data_len):
            encrypted_byte = data[i]
            dec_val = dec_vec[dec_idx] = data[i] = dec_vec[dec_idx] ^ encrypted_byte
            dec_idx ^= dec_val & 7

        # Write back decrypted vector  index
        self.decryption_index = dec_idx

        # Return the decrypted data as an EByteArray
        return data

    cpdef bytearray encrypt(self, bytearray raw_data):
        """
        Encrypt the raw_data using the internal encryption vector.
        Returns a new bytearray with the encrypted data.
        """
        
        cdef Py_ssize_t i, data_len
        cdef unsigned char raw_byte

        if not self.active:
            return raw_data

        cdef bytearray encrypted_data = bytearray(raw_data)
        data_len = len(encrypted_data)

        # Cache attributes
        cdef Py_ssize_t enc_idx = self.encryption_index
        cdef unsigned char* enc_vec = self.encryption_vector

        for i in range(data_len):
            raw_byte = raw_data[i]
            encrypted_data[i] = raw_byte ^ enc_vec[enc_idx]
            enc_vec[enc_idx] = raw_byte
            enc_idx ^= raw_byte & 7

        self.encryption_index = enc_idx

        return encrypted_data