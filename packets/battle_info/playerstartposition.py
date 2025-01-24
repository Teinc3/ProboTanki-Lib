from lib.codec.complex import Vector3DCodec
from lib.packets import AbstractPacket


class Player_Start_Position(AbstractPacket):
    id = -157204477
    description = "Player Start Position"
    codecs = [Vector3DCodec, Vector3DCodec]
    attributes = ['position', 'orientation']
