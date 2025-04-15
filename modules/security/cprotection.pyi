class CProtection:
    # Public attributes (if any were declared 'public cdef') could be listed here
    # Example: active: bool

    def __init__(self, flip_direction: bool = False) -> None: ...

    # cpdef methods are visible to Python
    def activate(self, keys: list[int]) -> None: ...

    def decrypt(self, encrypted_data: bytearray) -> bytearray: ...

    def encrypt(self, raw_data: bytearray) -> bytearray: ...

    # cdef methods are NOT included here as they are not directly callable from Python