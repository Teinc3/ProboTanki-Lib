from packets.abstractpacket import AbstractPacket


class Ping(AbstractPacket):
    id = -555602629
    description = 'Ping Packet from server'
    log = False