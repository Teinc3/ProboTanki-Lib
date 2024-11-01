class Address:
    def __init__(self, host: str, port: int):
        self.host = host
        self.port = port

    @property
    def split_args(self) -> tuple[str, int]:
        return self.host, self.port
