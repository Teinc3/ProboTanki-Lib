import platform
from scapy import all as Scapy
from scapy.packet import Packet, Raw
from scapy.layers.inet import TCP
from scapy.config import conf
from codec.XorProtectionContext import XorProtectionContext


def get_interface():
    current_os = platform.system()
    if current_os == "Darwin":
        return "en0"
    else:
        interfaces = conf.ifaces.data
        for iface in interfaces.values():
            if iface.name == "Ethernet 6":
                print(f"Selected interface: {iface.name} (Description: {iface.description})")
                return iface.name


def read_buffer(buffer, index, length):
    return buffer[index:index + length]


def get_bytes_available(buffer, index):
    return len(buffer) - index


class NetworkManager:
    PacketHeaderLength = 8

    def __init__(self):
        self.inboundProtection = XorProtectionContext()
        self.outboundProtection = XorProtectionContext()
        self.buffers = {
            "inbound": {"buffer": bytearray(), "index": 0, "unfinished": 0, "packetData": bytearray()},
            "outbound": {"buffer": bytearray(), "index": 0, "unfinished": 0, "packetData": bytearray()}
        }
        iface = get_interface()
        Scapy.sniff(iface=iface, filter="tcp", store=False, prn=self.process_packet)

    def process_packet(self, packet: Packet) -> None:
        if packet.haslayer(TCP) and packet.haslayer(Raw) and (1337 in [packet[TCP].dport, packet[TCP].sport]):
            direction = "inbound" if packet[TCP].sport == 1337 else "outbound"
            data = packet[Raw].load
            self.handle_packet(data, direction)

    def handle_packet(self, data: bytearray, direction: str) -> None:
        protection = self.inboundProtection if direction == "inbound" else self.outboundProtection
        buffer_info = self.buffers[direction]
        buffer_info["buffer"] += data
        buffer_info["index"] = buffer_info["unfinished"]

        while True:
            if get_bytes_available(buffer_info["buffer"], buffer_info["index"]) < NetworkManager.PacketHeaderLength:
                return
            packet_len = int.from_bytes(read_buffer(buffer_info["buffer"], buffer_info["index"], 4), signed=True)
            packet_id = int.from_bytes(read_buffer(buffer_info["buffer"], buffer_info["index"] + 4, 4), signed=True)
            buffer_info["index"] += 8
            remaining_len = packet_len - NetworkManager.PacketHeaderLength

            if get_bytes_available(buffer_info["buffer"], buffer_info["index"]) < remaining_len:
                buffer_info["unfinished"] = buffer_info["index"] - 8
                return

            if remaining_len > 0:
                buffer_info["packetData"] = read_buffer(buffer_info["buffer"], buffer_info["index"], remaining_len)
                buffer_info["index"] += remaining_len

            if protection.active:
                if direction == "inbound":
                    buffer_info["packetData"] = protection.decrypt_server(buffer_info["packetData"])
                else:
                    buffer_info["packetData"] = protection.decrypt_client(buffer_info["packetData"])

            if direction == "inbound" and packet_id == 2001736388:
                self.inboundProtection.activate(buffer_info["packetData"])
                self.outboundProtection.activate(buffer_info["packetData"])

            # if packet_len > 8:
            if packet_len > 8:
                print(
                    f"{"IN" if direction == "inbound" else "OUT"} [{packet_len}] | Packet ID: {packet_id} "
                    f"| Data: {'Data Too Big!' if packet_len >= 300 else buffer_info['packetData']}"
                )

            buffer_info["packetData"] = bytearray()
            if get_bytes_available(buffer_info["buffer"], buffer_info["index"]) == 0:
                break
            buffer_info["unfinished"] = buffer_info["index"]

        buffer_info["buffer"] = bytearray()
        buffer_info["index"] = 0
        buffer_info["unfinished"] = 0


if __name__ == "__main__":
    networkManager = NetworkManager()
