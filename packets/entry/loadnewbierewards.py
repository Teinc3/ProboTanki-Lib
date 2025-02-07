from ...packets import AbstractPacket

from ...codec.primitive import IntCodec
from ...codec.factory import VectorCodecFactory


class Load_Newbie_Rewards(AbstractPacket):
    id = 602656160
    description = "Tells the client which beginner rewards the player has yet to complete"
    attributes = ["incompleteRewards"]
    codecs = [VectorCodecFactory(int, IntCodec)]