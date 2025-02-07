from ...codec.custom import MissionCodec
from ...codec.custom import MissionStreakCodec
from ...codec.factory import VectorCodecFactory
from ...packets import AbstractPacket


class Show_Missions(AbstractPacket):
    id = 809822533
    description = 'Show the list of missions currently available to the player'
    attributes = ['missions', 'weeklyStreakInfo']
    codecs = [VectorCodecFactory(dict, MissionCodec), MissionStreakCodec]
