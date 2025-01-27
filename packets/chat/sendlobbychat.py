from lib.codec.complex import StringCodec
from lib.packets import AbstractPacket
from lib.packets.status import Subscribe_Status


class Send_Lobby_Chat(AbstractPacket):
    id = 705454610
    description = "Sends a chat message to the lobby"
    codecs = [StringCodec, StringCodec]
    attributes = ['username', 'message']

    def process(self):
        if self.object['message'].startswith('\\'):
            # Extract the command and arguments
            command, *args = self.object['message'][1:].split(' ')
            if command == 'subscribe':
                # Get argument
                target = args[0]
                # Subscribe to the target
                packet = Subscribe_Status()
                packet.objects = [target]
                self.sockets.server.sendall(packet.wrap(self.protections.c2s))

            return True # Do not forward the packet to the server
        
        super().process()
        return False