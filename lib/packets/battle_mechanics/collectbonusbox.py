from lib.codec.complex import StringCodec
from lib.packets.abstractpacket import AbstractPacket


from threading import Thread
import time


class Collect_Bonus_Box(AbstractPacket):
    id = -1047185003
    description = "Collect a crystal box"
    codecs = [StringCodec]
    attributes = ['bonusId']