from ...packets import AbstractPacket


class Pong(AbstractPacket):
    id = 1484572481
    description = 'Pong Packet from client'
    shouldLog = False
