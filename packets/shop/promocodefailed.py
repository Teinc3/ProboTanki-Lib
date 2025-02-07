from ...packets import AbstractPacket


class Promocode_Failed(AbstractPacket):
    id = -1850050333
    description = 'Incorrect or expired promocode'
