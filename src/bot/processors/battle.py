from datetime import datetime as Datetime
from enum import Enum
from threading import Thread
import random
import time

from .abstractprocessor import AbstractProcessor
from bot.enums import ProcessorIDs


class BattleProcessor(AbstractProcessor):
    processorID = ProcessorIDs.P_BATTLE

    # Speed factor for spoofing client time
    CLIENT_TIME_SPOOF_FACTOR = 1

    def __init__(self, holder):
        super().__init__(holder)

        self._client_time = 0
        self._last_client_time = Datetime.now().timestamp()

        self.time_left = 0
        self.players: list[Player] = []
        self.status: Alive_Status = None

        self.battle_loop: Thread = None

    @property
    def client_time(self):
        current_time = Datetime.now().timestamp()
        elapsed_time = (current_time - self._last_client_time) * 1000

        self._client_time += int(self.CLIENT_TIME_SPOOF_FACTOR * elapsed_time)
        self._last_client_time = current_time

        return self._client_time
    
    @client_time.setter
    def client_time(self, value):
        self._client_time = value
        self._last_client_time = int(Datetime.now().timestamp() * 1000)

    def process_packets(self):
        packet_obj = self.current_packet.object

        if self.compare_packet("Init_Battle_Stats"):
            self.time_left = packet_obj['timeLeft']

            # Check if we can spawn now
            if self.time_left > 0:
                self.status = Alive_Status.NEW_ENTRY
                self.create_timer(self.status.value, self.packetManager.get_packet_by_name("Death_Delay_End")())
            else:
                # Intermediary sessions are around 10 seconds, just an approximation, can be done with a more specific packet
                self.create_timer(10, self.packetManager.get_packet_by_name("Death_Delay_End")())

        elif self.compare_packet("Left_Team_Battle"):
            # Remove player from the list
            username = packet_obj['username']
            self.players = [player for player in self.players if player.name != username]

            print(username + " has left the team battle.")

        elif self.compare_packet("Player_Start_Position"):
            # We have our new spawn, create a Send_Respawn packet after timer
            self.status = Alive_Status.CHANGING_SPAWN
            self.create_timer(self.status.value, self.packetManager.get_packet_by_name("Send_Respawn")()) # Has no data

        elif self.compare_packet("Start_Resp_Fantom"):
            # Add the player to the list
            player = next((player for player in self.players if player.name == packet_obj['username']), None)
            if not player:
                self.players.append(Player(
                    name=packet_obj['username'],
                    team=packet_obj['team'],
                    incarnation_id=packet_obj['incarnationID'],
                    position=packet_obj['position'],
                    health=packet_obj['health'],
                    inresp=True
                ))
            else:
                player.team = packet_obj['team'] # It might change due to team swap, for short battles :think:
                player.incarnation_id = packet_obj['incarnationID']
                player.position = packet_obj['position']
                player.health = packet_obj['health'] # Probably just 10k lol

            # If it's us, end the phantom state after 2.5 seconds
            if packet_obj['username'] == self.holder.storage['credentials']['username']:
                self.status = Alive_Status.FANTOM
                self.create_timer(self.status.value, self.packetManager.get_packet_by_name("End_Resp_Fantom")())

        elif self.compare_packet("Fully_Respawned"):
            affected_player = next((player for player in self.players if player.name == packet_obj['username']), None)
            if affected_player:
                affected_player.inresp = False

            if packet_obj['username'] == self.holder.storage['credentials']['username']:
                self.status = Alive_Status.ALIVE
                print(packet_obj['username'] + " has fully respawned.")

                # Now we can run the main battle loop
                self.battle_loop = Thread(target=self.exec_battle_loop, name=f"Battle Loop {self.holder.storage['sheep_id']} ({self.holder.storage['credentials']['username']})")
                self.battle_loop.daemon = True
                self.battle_loop.start()

        elif self.compare_packet("Smoky_Shot_IN"):
            if self.holder.storage['credentials']['username'] == packet_obj['target']:
                print(f"{packet_obj['target']} has been{' critically' if packet_obj['isCritical'] else ''} shot by {packet_obj['shooter']}")

        elif self.compare_packet("Tank_Health"):
            player = next((player for player in self.players if player.name == packet_obj['username']), None)
            if player:
                player.health = packet_obj['health']

            if packet_obj['username'] == self.holder.storage['credentials']['username']:
                print(f"{packet_obj['username']} has {packet_obj['health']} health left.")

        elif self.compare_packet("Kill_Confirm") or self.compare_packet("Self_Destructed"):
            user = next((player for player in self.players if player.name == packet_obj['username']), None)
            if not user:
                return
            
            user.inresp = True
            
            if user == self.holder.storage['credentials']['username']:
                self.status = Alive_Status.DEAD_DELAY
                self.create_timer(self.status.value, self.packetManager.get_packet_by_name("Death_Delay_End")())

            if self.holder.storage['credentials']['username'] == packet_obj['username']:
                print(packet_obj['username'] + " has been killed" + (f" by " + packet_obj['killer'] if 'killer' in packet_obj else "."))

    def exec_battle_loop(self):
        while self.status == Alive_Status.ALIVE:
            # Every 2 seconds we shoot at an enemy with smoky

            # Find my instance
            me = next((player for player in self.players if player.name == self.holder.storage['credentials']['username']), None)
            if not me:
                return
            
            # Find the enemy with the lowest health that is still alive
            enemy = min([player for player in self.players if player.team != me.team and not player.inresp], key=lambda x: x.health, default=None)
            if not enemy:
                return
            
            # Shoot at the enemy
            packet = self.packetManager.get_packet_by_name("Smoky_Shoot_Target_OUT")()
            packet.object['clientTime'] = self.client_time
            packet.object['target'] = enemy.name
            packet.object['incarnationID'] = enemy.incarnation_id

            # We do some trolling here
            packet.object['targetBodyPosition'] = enemy.position
            packet.object['localHitPoint'] = Player.generate_vector_offset(100)
            packet.object['globalHitPoint'] = enemy.generate_global_position(Player.generate_vector_offset(100))
            
            packet.deimplement()
            self.send_packet(packet)
            print(self.holder.storage['credentials']['username'], "tries to shoot:", packet.object)

            # Wait 2 seconds
            time.sleep(2)
        
class Player:
    def __init__(self, name: str, team: int, inresp: bool, incarnation_id: int = None, position: dict[str, float] = None, health: float = 10000):
        self.name = name
        self.team = team
        self.inresp = inresp
        self.incarnation_id = incarnation_id
        self.position = position
        self.health = health

    def __eq__(self, other):
        return self.__repr__() == other.__repr__()
    
    def __repr__(self):
        return "Player " + self.name
    
    def generate_global_position(self, vector: dict[str, float] = None):
        vector = vector if vector else self.generate_vector_offset()
        return {
            'x': self.position['x'] + vector['x'],
            'y': self.position['y'] + vector['y'],
            'z': self.position['z'] + vector['z']
        }
    
    @staticmethod
    def generate_vector_offset(magnitude: float = 200):
        return {
            'x': random.random() * magnitude,
            'y': random.random() * magnitude,
            'z': random.random() * magnitude
        }
    

class Alive_Status(Enum):
    """Enumeration of possible player states in the game."""

    ALIVE = 0
    """This is when you are alive."""

    DEAD_DELAY = 3
    """
    This is when you are just shot dead, but the server has not given you a new spawn point yet.
    It takes exactly 3 seconds and corresponds to respDelay.
    When you send Death_Delay_End, the server gives you a Player_Start_Position packet.
    """

    NEW_ENTRY = 0
    """Same as DEAD_DELAY, but I think you have no delay and can call it immediately."""

    CHANGING_SPAWN = 3
    """
    This is when your camera is moving over the new spawn point.
    After 3 seconds, you do Send_Respawn packet, and then server will respond with Start_Resp_Fantom after additional 1.5 seconds.
    """

    FANTOM = 2.5
    """
    This is when you are spawned in with a phantom.
    You end the phantom state using the End_Resp_Fantom packet.
    Fantom takes normally 2.5 seconds, but it can be extended if you don't end it
    """