from codec.base import CustomBaseCodec

from codec.complex import StringCodec
from codec.custom import BattleInfoCodec


class BattleNotifierCodec(CustomBaseCodec):
    attributes = ["battleInfo", "username"]
    codecs = [BattleInfoCodec, StringCodec]
