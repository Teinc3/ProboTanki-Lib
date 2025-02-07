from ...packets import AbstractPacket


class Spectate_Battle(AbstractPacket):
    id = -1315002220
    description = 'Client requests to spectate the selected battle'
