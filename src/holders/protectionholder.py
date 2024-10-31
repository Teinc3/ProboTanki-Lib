from protection import Protection

class ProtectionHolder:
    def __init__(self):
        self.s2c = Protection(True)
        self.c2s = Protection(False)
        # self.debug_s2c = Protection(True)
        # self.debug_c2s = Protection(False)

    def activate(self, keys: list[int]):
        self.s2c.activate(keys)
        self.c2s.activate(keys)
        # self.debug_s2c.activate(keys)
        # self.debug_c2s.activate(keys)