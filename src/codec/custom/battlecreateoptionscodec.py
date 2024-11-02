from codec.base import CustomBaseCodec
from codec.primitive import BoolCodec, IntCodec
from codec.complex import StringCodec, DoubleIntCodec


class BattleCreateOptionsCodec(CustomBaseCodec):
    
    attributes = ["autoBalance", "battleMode", "format", "friendlyFire", "battleLimits", "mapId", 
                  "maxPeopleCount","name", "parkourMode", "privateBattle", "proBattle", "rankRange", 
                  "rearm", "theme", "noSupplyBoxes", "noCrystalBoxes", "noSupplies", "noUpgrade"]
    codecs = [BoolCodec, IntCodec, IntCodec, BoolCodec, DoubleIntCodec, IntCodec, 
              IntCodec, StringCodec, BoolCodec, BoolCodec, BoolCodec, DoubleIntCodec, 
              BoolCodec, IntCodec, BoolCodec, BoolCodec, BoolCodec, BoolCodec]

    # Since this packet should be C2S, note that the encode method includes the noUpgrade attribute (which is absent in decode) 
    # But since we have to decode the "Encoded" packet, we have to include the noUpgrade attribute in the decode method