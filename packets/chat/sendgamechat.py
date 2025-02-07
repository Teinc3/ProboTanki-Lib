from ...codec.complex import StringCodec
from ...codec.primitive import BoolCodec
from ...packets import AbstractPacket

from ...packets.battle_mechanics.endrespfantom import End_Resp_Fantom


class Send_Game_Chat(AbstractPacket):
    id = 945463181
    description = "Sends a message to the game chat"
    codecs = [StringCodec, BoolCodec]
    attributes = ['message', 'teamOnly']

    def process(self):
        if self.object['message'].startswith('\\'):
            # Extract the command and arguments
            command, *args = self.object['message'][1:].split(' ')
            if command == 'endresp':
                self.sockets.server.sendall(End_Resp_Fantom().wrap(self.protections.c2s))

            return True # Do not forward the packet to the server
        
        super().process()
        return False