from packets.abstractpacket import AbstractPacket


class Supply_Box_Drop(AbstractPacket):
    id = 1831462385
    description = "A supply box has been dropped"
    attributes = ['supplyBoxID', 'position', "fallTimeThreshold"]
