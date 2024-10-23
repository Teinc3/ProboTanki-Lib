from scapy import all as Scapy
from scapy.packet import Packet, Raw
from scapy.layers.inet import TCP

from codec.XorProtectionContext import XorProtectionContext

class NetworkManager:
    PacketHeaderLength = 8

    def __init__(self):
        self.inboundProtection = XorProtectionContext()
        self.outboundProtection = XorProtectionContext()
        
        self.dataBuffer = bytearray()
        self.dataBufferIndex = 0
        self.unfinishedPacketPosition = 0
        self.packetByteArray = bytearray()

        # Start sniffing
        Scapy.sniff(iface="en0", filter="tcp", store=False, prn=self.process_packet)

    def read_buffer(self, length: int) -> bytearray:
        data = self.dataBuffer[self.dataBufferIndex:self.dataBufferIndex + length]
        self.dataBufferIndex += length
        return data

    def get_bytes_available(self) -> int:
        return len(self.dataBuffer) - self.dataBufferIndex

    def process_packet(self, packet: Packet) -> None:
        # If we are sending raw data to the server
        if packet.haslayer(TCP) and packet.haslayer(Raw) and (1337 in [packet[TCP].dport, packet[TCP].sport]):
            if packet[TCP].sport == 1337:
                self.process_incoming_packet(packet[Raw].load)
            else:
                self.process_outbound_packet(packet[Raw].load)

    def process_incoming_packet(self, data: bytearray) -> None:
        # Copy the packet to the databuffer
        self.dataBuffer += data

        self.dataBufferIndex = self.unfinishedPacketPosition

        while True:
            if self.get_bytes_available() < NetworkManager.PacketHeaderLength:
                return

            # Read 2 signed-integers from the buffer simultaneously
            thisPacketLen = int.from_bytes(self.read_buffer(4), signed=True)
            packetID = int.from_bytes(self.read_buffer(4), signed=True)
            remainingPacketLen = thisPacketLen - NetworkManager.PacketHeaderLength

            if self.get_bytes_available() < remainingPacketLen:
                return
            if remainingPacketLen > 0:
                self.packetByteArray = self.read_buffer(remainingPacketLen)

            try:
                # Do sth with the packet
                if self.inboundProtection.active:
                    self.packetByteArray = self.inboundProtection.decrypt_server(self.packetByteArray)
                
                if packetID == 2001736388:
                    # Decrypt the hash and Activate both inbound and outbound protection
                    self.inboundProtection.activate(self.packetByteArray)
                    self.outboundProtection.activate(self.packetByteArray)
                
                packetLen = len(self.packetByteArray)
                if (packetLen > 0):
                    print(f"IN [{packetLen}] | Packet ID: {packetID} | Packet Data: {'Data Too Big!' if packetLen >= 300 else self.packetByteArray}")

            except Exception as e:
                print(e)

            self.packetByteArray = bytearray()
            if self.get_bytes_available() == 0:
                break
            self.unfinishedPacketPosition = self.dataBufferIndex

        self.dataBuffer = bytearray()
        self.dataBufferIndex = 0
        self.unfinishedPacketPosition = 0

    def process_outbound_packet(self, data: bytearray) -> None:
        # As outbound packets are flushed, we don't need to buffer them to process an entire packet
        packetLen = int.from_bytes(data[0:4])
        packetID = int.from_bytes(data[4:8], signed=True)
        packetData = data[8:]
        if self.outboundProtection.active:
            packetData = self.outboundProtection.decrypt_client(packetData)

        if packetLen > 8:
            print(f"OUT [{packetLen}] | Packet ID: {packetID} | Packet Data: {'Data Too Big!' if packetLen >= 300 else packetData}")

   
if __name__ == "__main__":
    networkManager = NetworkManager()