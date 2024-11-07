from packets.abstractpacket import AbstractPacket

from codec.complex import Vector3DCodec, VectorVector3DCodec, VectorStringCodec, VectorShortCodec
from codec.primitive import IntCodec
from packets.abstractpacket import AbstractPacket

from utils.ebytearray import EByteArray


class Railgun_Shot_OUT(AbstractPacket):
    id = -484994657
    description = "Sends server details about a released railgun shot"
    attributes = ["clientTime", "staticHitPoint", "targets", "targetHitPoints", "incarnationIDs", "targetBodyPositions", "unknown3DVectors"]
    codecs = [IntCodec, Vector3DCodec, VectorStringCodec, VectorVector3DCodec, VectorShortCodec, VectorVector3DCodec, VectorVector3DCodec]

    def process(self):
        self.object["targets"] *= 3
        self.object["targetHitPoints"] *= 3
        self.object["incarnationIDs"] *= 3
        self.object["targetBodyPositions"] *= 3
        self.object["unknown3DVectors"] *= 3

        self.deimplement()
        
        packet_len, _, unencrypted_data = self.wrap()
        self.sockets.server.sendall(EByteArray().write_int(packet_len).write_int(self.id).write(self.protections.c2s.encrypt(unencrypted_data)))

        super().process()
        return
