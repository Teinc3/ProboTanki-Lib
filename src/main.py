import platform
from scapy import all as Scapy
from scapy.packet import Packet, Raw
from scapy.layers.inet import TCP
from scapy.config import conf

from Processor import Processor
from Listener import Listener

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

class Manager:
    def __init__(self):
        self.processor = Processor(self)
        self.listeners = {
            "in": Listener(True, self.processor),
            "out": Listener(False, self.processor)
        }

        iface = get_interface()
        Scapy.sniff(iface=iface, filter="tcp", store=False, prn=self.process_packet)

    def process_packet(self, packet: Packet) -> None:
        if packet.haslayer(TCP) and packet.haslayer(Raw) and (1337 in [packet[TCP].dport, packet[TCP].sport]):
            direction = packet[TCP].sport == 1337
            data = packet[Raw].load

            listener = self.listeners["in" if direction else "out"]
            listener.on_socket_data(data)

if __name__ == "__main__":
    networkManager = Manager()
