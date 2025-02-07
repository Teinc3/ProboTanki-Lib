from ...codec.complex import StringCodec
from ...codec.primitive import FloatCodec, ShortCodec
from ...packets import AbstractPacket


class Tank_Stat_Synced(AbstractPacket):
    id = -1672577397
    description = "Server syncs tank movement stats with client"
    attributes = ["username", "maxSpeed", "maxTurnSpeed", "maxTurretRotationSpeed", "acceleration", "specificationID"]
    codecs = [StringCodec, FloatCodec, FloatCodec, FloatCodec, FloatCodec, ShortCodec]

# MUST TAKE specificationID INTO PROCESSOR