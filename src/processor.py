from holders.socketholder import SocketHolder
from holders.protectionholder import ProtectionHolder
from codec.ebytearray import EByteArray

from config.packets import Packets

class Processor:
    HEADER_LEN = 8
    
    sockets: SocketHolder
    protections: ProtectionHolder

    def __init__(self, sockets: SocketHolder, protections: ProtectionHolder):
        self.protections = protections
        self.sockets = sockets

    def parse_inbound(self, packet_len: int, packet_id: int, packet_data: EByteArray):
        interest = True
        data_copy = EByteArray(packet_data)
        
        if packet_id == Packets.Activate_Protection:
            keys_len = packet_data.read_int()
            keys = []
            for _ in range(keys_len):
                key = packet_data.read_byte()
                keys.append(key)
            self.protections.activate(keys)
            print("Protection Activated")

        elif packet_id == Packets.Ping:
            interest = False
            
        if packet_len > Processor.HEADER_LEN or interest:
            print(f"IN [{packet_len}] | ID: {packet_id} ({Packets.get_name(packet_id)}) | Data: {data_copy.trim()}")
        
    def parse_outbound(self, packet_len: int, packet_id: int, packet_data: EByteArray):
        interest = True

        if packet_id == Packets.Pong:
            interest = False

        if packet_len > Processor.HEADER_LEN or interest:
            print(f"OUT [{packet_len}] | ID: {packet_id} ({Packets.get_name(packet_id)}) | Data: {packet_data.trim()}")