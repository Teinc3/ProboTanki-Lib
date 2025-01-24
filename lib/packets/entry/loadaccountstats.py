from lib.packets.abstractpacket import AbstractPacket
from lib.codec.primitive import IntCodec, BoolCodec, ByteCodec, FloatCodec
from lib.codec.complex import StringCodec


class Load_Account_Stats(AbstractPacket):
    id = 907073245
    description = "Loads the player's own account stats"
    attributes = ["crystals", "currentRankXP", "doubleCrystalLength", "hasDoubleCrystal", "nextRankXP", "ratingRank",
                  "rank", "rating", "XP", "serverNumber", "username", "userProfileUrl"]
    codecs = [IntCodec, IntCodec, IntCodec, BoolCodec, IntCodec, IntCodec,
              ByteCodec, FloatCodec, IntCodec, IntCodec, StringCodec, StringCodec]