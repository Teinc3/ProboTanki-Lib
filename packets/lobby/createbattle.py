from lib.codec.complex import StringCodec
from lib.codec.custom import BattleLimitsCodec, RankRangeCodec
from lib.codec.primitive import BoolCodec, IntCodec
from lib.packets.abstractpacket import AbstractPacket


class Create_Battle(AbstractPacket):
    id = -2135234426
    description = 'Creates a new battle'
    attributes = ["autoBalance", "battleMode", "format", "friendlyFire", "battleLimits", "mapID",
                  "maxPeopleCount", "name", "parkourMode", "privateBattle", "proBattle", "rankRange",
                  "rearm", "theme", "noSupplyBoxes", "noCrystalBoxes", "noSupplies", "noUpgrade"]
    codecs = [BoolCodec, IntCodec, IntCodec, BoolCodec, BattleLimitsCodec, StringCodec,
              IntCodec, StringCodec, BoolCodec, BoolCodec, BoolCodec, RankRangeCodec,
              BoolCodec, IntCodec, BoolCodec, BoolCodec, BoolCodec, BoolCodec]

    # The "decode" method (s2c) does not have the noUpgrade attribute
    # But since this packet is C2S, we have to include the noUpgrade attribute in the decode method
