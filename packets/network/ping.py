from ...packets import AbstractPacket


class Ping(AbstractPacket):
    id = -555602629
    description = 'Ping Packet from server'
    shouldLog = False
