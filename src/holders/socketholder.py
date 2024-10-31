import socket

class SocketHolder:
    server: socket.socket
    client: socket.socket | None

    def __init__(self):
        self.server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.client = None # Listen for client connection

    def close(self):
        self.server.close()
        self.client.close()