from ...packets import AbstractPacket

from ...codec.primitive import IntCodec, BoolCodec
from ...codec.complex import StringCodec, VectorStringCodec
from ...codec.custom import BattleLimitsCodec


class Init_Battle_Stats(AbstractPacket):
    id = 522993449
    description = "Loads current battle statistics"
    attributes = ["battleMode", "format", "fund", "battleLimits", "mapName", "maxPeopleCount",
                  "parkourMode", "premiumBonusPercentage", "spectator", "suspiciousUsers", "timeLeft"]
    codecs = [IntCodec, IntCodec, IntCodec, BattleLimitsCodec, StringCodec, IntCodec,
                BoolCodec, IntCodec, BoolCodec, VectorStringCodec, IntCodec]