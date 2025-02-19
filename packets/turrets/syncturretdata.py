from ...packets import AbstractPacket
from ...codec.complex import JsonCodec


class Sync_Turret_Data(AbstractPacket):
    id = -2124388778
    description="Syncs turret data to the client"
    attributes=["json"]
    codecs=[JsonCodec]