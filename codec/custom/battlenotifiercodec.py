from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec
from .battleinfocodec import BattleInfoCodec


class BattleNotifierCodec(CustomBaseCodec):
    attributes = ["battleInfo", "username"]
    codecs = [BattleInfoCodec, StringCodec]
