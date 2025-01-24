from typing import Optional


class Address:
    def __init__(self, host: str, port: int, username: Optional[str] = None, password: Optional[str] = None):
        self.host = host
        self.port = port
        self.username = username
        self.password = password

    def __repr__(self):
        if hasattr(self, "username") and hasattr(self, "password"):
            return f"{self.username}:{self.password}@{self.host}:{self.port}"
        else:
            return f"{self.host}:{self.port}"

    @property
    def split_args(self) -> tuple[str, int]:
        return self.host, self.port
