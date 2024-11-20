import socks
from typing import Optional


class SocketHolder:
    server: socks.socksocket
    client: Optional[socks.socksocket]

    def __init__(self):
        self.server = socks.socksocket(socks.socket.AF_INET, socks.socket.SOCK_STREAM)
        self.client = None  # Listen for client connection

    def close(self):
        self.server.close()
        self.client.close()
