from ...packets import AbstractPacket

from ...codec.complex import VectorStringCodec


class Name_Unavailable(AbstractPacket):
    id = 442888643
    description = "Said name is unavailable for registration with a list of alternative suggested usernames"
    attributes = ["usernames"]
    codecs = [VectorStringCodec]