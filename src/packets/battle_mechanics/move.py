from codec.custom.movecodec import MoveCodec
from codec.primitive import IntCodec, ShortCodec
from packets.abstractpacket import AbstractPacket


class Move(AbstractPacket):
    # last_client_time = 0
    # last_pos_z = 0

    id = 329279865
    description = "Sends your movement data to the server"
    attributes = ['clientTime', 'specificationID', 'movement']
    codecs = [IntCodec, ShortCodec, MoveCodec]

    # def process(self):
    #     if Move.last_client_time == 0:
    #         Move.last_client_time = self.object["clientTime"]
    #         Move.last_pos_z = self.object["movement"]["pos"]["z"]
    #         return False
        
    #     elif self.object["clientTime"] - Move.last_client_time > 6000:
    #         Move.last_client_time = self.object["clientTime"]
    #         Move.last_pos_z = self.object["movement"]["pos"]["z"]
    #         return False
        
    #     cur_time = self.object["clientTime"]
    #     self.object["movement"]["linV"]["z"] = 20
    #     self.object["movement"]["pos"]["z"] = Move.last_pos_z + 20 * (cur_time - Move.last_client_time) / 1000

    #     Move.last_client_time = cur_time
    #     Move.last_pos_z = self.object["movement"]["pos"]["z"]

    #     self.deimplement()
        
    #     packet_len, _, unencrypted_data = self.wrap()
    #     self.sockets.server.sendall(EByteArray().write_int(packet_len).write_int(self.id).write(self.protections.c2s.encrypt(unencrypted_data)))

    #     super().process()
    #     return True