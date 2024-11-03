from packets.abstractpacket import AbstractPacket

from codec.custom.battlecreateoptionscodec import BattleCreateOptionsCodec


class Create_Battle(AbstractPacket):
    id = -2135234426
    description = 'Creates a new battle'
    codecs = [BattleCreateOptionsCodec]
    attributes = ["battleCreateOptions"]
