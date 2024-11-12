import json
import random

from codec.complex import Vector3DCodec, VectorVector3DCodec, VectorStringCodec, VectorShortCodec
from codec.primitive import IntCodec
from modules.processor import user_data
from packets.abstractpacket import AbstractPacket
from utils.ebytearray import EByteArray


class Railgun_Shot_OUT(AbstractPacket):
    id = -484994657
    description = "Sends server details about a released railgun shot"
    attributes = ["clientTime", "staticHitPoint", "targets", "targetHitPoints", "incarnationIDs", "targetBodyPositions",
                  "unknown3DVectors"]
    codecs = [IntCodec, Vector3DCodec, VectorStringCodec, VectorVector3DCodec, VectorShortCodec, VectorVector3DCodec,
              VectorVector3DCodec]

    # def process(self):
    #     self.object["clientTime"] = self.object["clientTime"]
    #     self.object["incarnationIDs"] = list(user_data.values())
    #     self.object["targets"] = list(user_data.keys())
    #     self.object["staticHitPoint"] = {"x": 0, "y": 0, "z": 0}
    #     self.object["targetHitPoints"] = [{"x": 0, "y": 0, "z": 0}] * len(user_data)
    #     self.object["targetBodyPositions"] = [{"x": 0, "y": 0, "z": 0}] * len(user_data)
    #     self.object["unknown3DVectors"] = [{"x": 0, "y": 0, "z": 0}] * len(user_data)
    #
    #     self.deimplement()
    #     print(self.object)
    #
    #     packet_len, _, unencrypted_data = self.wrap()
    #
    #     self.sockets.server.sendall(EByteArray().write_int(packet_len).write_int(self.id).write(
    #         self.protections.c2s.encrypt(unencrypted_data)))
    #
    #     super().process()
    #     return True
