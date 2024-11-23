from lib.modules.protection import Protection


class ProtectionHolder:
    def __init__(self):
        self.s2c = Protection(proxy=True, direction=True)
        self.c2s = Protection(proxy=True, direction=False)

    def activate(self, keys: list[int]):
        self.s2c.activate(keys)
        self.c2s.activate(keys)
