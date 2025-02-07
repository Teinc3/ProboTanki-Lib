from ...packets import AbstractPacket

from ...codec.complex import VectorStringCodec


class Load_Friends_List(AbstractPacket):
    id = 1422563374
    description = "Loads the player's friend lists"
    attributes = ["accepted", "newAccepted", "incoming", "newIncoming", "outgoing"]
    codecs = [VectorStringCodec] * 5