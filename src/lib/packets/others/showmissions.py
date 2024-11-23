from lib.codec.custom import MissionCodec
from lib.codec.custom import MissionStreakCodec
from lib.codec.factory import VectorCodecFactory
from lib.packets.abstractpacket import AbstractPacket


class Show_Missions(AbstractPacket):
    id = 809822533
    description = 'Show the list of missions currently available to the player'
    attributes = ['missions', 'weeklyStreakInfo']
    codecs = [VectorCodecFactory(dict, MissionCodec), MissionStreakCodec]
