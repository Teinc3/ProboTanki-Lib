from packets.abstractpacket import AbstractPacket

from codec.factory import VectorCodecFactory
from codec.custom.missioncodec import MissionCodec
from codec.custom.missionstreakcodec import MissionStreakCodec


class Show_Missions(AbstractPacket):
    id = 809822533
    description = 'Show the list of missions currently available to the player'
    attributes = ['missions', 'weeklyStreakInfo']
    codecs = [VectorCodecFactory(MissionCodec), MissionStreakCodec]