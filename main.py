from scapy import all as Scapy
from scapy.packet import Packet, Raw
from scapy.layers.inet import TCP

def process_packet(packet: Packet) -> None:
    # If we are sending raw data to the server
    if packet.haslayer(TCP) and packet.haslayer(Raw) and packet[TCP].dport == 1337:
        # If the PUSH flag is set
        if packet[TCP].flags & 0x08:  # 0x08 is the PSH flag
            print(packet[Raw].load)
        else:
            print(packet[Raw].load + " (Not PSH)")

def main() -> None:
    # Sniffing
    Scapy.sniff(iface="en0", filter="tcp", store=False, prn=process_packet)

if __name__ == "__main__":
    main()