from codec.base import CustomBaseCodec
from codec.primitive import BoolCodec, IntCodec, StringCodec
from codec.complex.doubleintcodec import DoubleIntCodec


class BattleCreateOptionsCodec(CustomBaseCodec):
    
    attributes = ["autoBalance", "battleMode", "format", "friendlyFire", "battleLimits", "mapId", 
                  "maxPeopleCount","name", "parkourMode", "privateBattle", "proBattle", "rankRange", 
                  "rearm", "theme", "noSupplyBoxes", "noCrystalBoxes", "noSupplies", "noUpgrade"]
    codecs = [BoolCodec, IntCodec, IntCodec, BoolCodec, DoubleIntCodec, IntCodec, 
              IntCodec, StringCodec, BoolCodec, BoolCodec, BoolCodec, DoubleIntCodec, 
              BoolCodec, IntCodec, BoolCodec, BoolCodec, BoolCodec, BoolCodec]

    # For decode, we don't use the last codec, hence override - but for Encode we do, so we use superclass method for that 
    def decode(self):
        return {self.attributes[i]: self.codecs[i](self._buffer).decode() for i in range(len(self.codecs - 1))}
    