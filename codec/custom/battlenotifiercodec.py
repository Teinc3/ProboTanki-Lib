from lib.codec.base import CustomBaseCodec
from lib.codec.complex import StringCodec
from lib.codec.custom import BattleInfoCodec


class BattleNotifierCodec(CustomBaseCodec):
    attributes = ["battleInfo", "username"]
    codecs = [BattleInfoCodec, StringCodec]
