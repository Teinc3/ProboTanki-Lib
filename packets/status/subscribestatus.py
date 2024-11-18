from codec.complex import StringCodec
from packets.abstractpacket import AbstractPacket


class Subscribe_Status(AbstractPacket):
    # _has_called = False
    id = 1774907609
    description = "Subscribe to status updates of a player."
    attributes = ['username']
    codecs = [StringCodec]
    shouldLog = False

    # def process(self):
    #     if Subscribe_Status._has_called:
    #         return
        
    #     Subscribe_Status._has_called = True
    
    #     # Otherwise, we craft a packet to subscribe to all fucking mods and admins in the game! hehehehaw
    #     mods = ['CreatorTheGreat', 'Mode', 'Bananza1337', 'Kyanq', 'R.e', 'Profiler', '2wham', 'Sashga', 'Jhz', 'Armor', '20matar70correr', 'dexth', 'debug', 'Hayro', 'MaJor', 'Dont_Break_My_Heart', 'ladraodegold', 'Kokory', 'Capita', 'kl_nazariy', 'Mr.Soyer', 'kapodelimao', 'Nan', 'M0Gz', 'Specter', 'RIOT', 'RERO', 'Anestesic', 'kamusk', 'Eyes', 'target', 'CaMyCb', 'Lead', 'New.Day', 'Brave', 'test', 'supermegaomega', 'STAFF.BR', 'Samo', 'JhowJhow', 'FearIess', 'SNX', 'AndreyZT', 'xakep33rus', 'Dream']

    #     for mod_name in mods:
    #         self.object["username"] = mod_name
    #         self.deimplement()

    #         packet_len, _, unencrypted_data = self.wrap()
    #         self.sockets.server.sendall(EByteArray().write_int(packet_len).write_int(self.id).write(self.protections.c2s.encrypt(unencrypted_data)))
    #         self.log()

    #         sleep(0.05)
        
    #     return True