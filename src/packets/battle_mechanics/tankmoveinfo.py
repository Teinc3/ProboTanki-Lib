from packets.abstractpacket import AbstractPacket

from codec.primitive import FloatCodec, ShortCodec
from codec.complex import StringCodec


class Tank_Stat_Synced(AbstractPacket):
    id = -1672577397
    description = "Server syncs tank movement stats with client"
    attributes = ["tankID", "maxSpeed", "maxTurnSpeed", "maxTurretRotationSpeed", "acceleration", "specificationID"]
    codecs = [StringCodec, FloatCodec, FloatCodec, FloatCodec, FloatCodec, ShortCodec]

# MUST TAKE specificationID INTO PROCESSOR