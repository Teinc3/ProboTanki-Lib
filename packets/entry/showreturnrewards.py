from .. import AbstractPacket
from ...codec.complex import JsonCodec
from ...codec.custom import BonusInfoCodec


class Show_Return_Rewards(AbstractPacket):
    id = 855420488
    description = "Shows return rewards for inactive accounts"
    codecs = [JsonCodec, BonusInfoCodec]
    attributes = ['json', 'bonusInfo']


__all__ = ['Show_Return_Rewards']
