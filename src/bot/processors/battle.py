from datetime import datetime as Datetime
from enum import Enum
from threading import Thread, Lock
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
        # self._client_time_mod = -1

        self.time_left = 0
        
        self._players: list[Player] = []
        self._players_lock = Lock()

        self._status: Alive_Status = None
        self._status_lock = Lock()

    @property
    def players(self):
        with self._players_lock:
            return self._players
        
    @players.setter
    def players(self, value):
        with self._players_lock:
            self._players = value

    @property
    def status(self):
        with self._status_lock:
            return self._status
        
    @status.setter
    def status(self, value):
        with self._status_lock:
            self._status = value

    @property
    def client_time(self):
        current_time = Datetime.now().timestamp()
        elapsed_time = (current_time - self._last_client_time) * 1000

        self._client_time += int(self.CLIENT_TIME_SPOOF_FACTOR * elapsed_time)
        self._last_client_time = current_time
        
        # Note: _client_time differences must have a modulus of 33

        return self._client_time
    
    @property
    def modded_client_time(self):
        # We also access the client_time property function so that its updated to the latest
        client_time = self.client_time
        return client_time + (33 - (client_time % 33))
    
    @client_time.setter
    def client_time(self, value):
        self._client_time = value
        self._last_client_time = int(Datetime.now().timestamp() * 1000)

    def process_packets(self):
        packet_obj = self.current_packet.object

        if self.compare_packet("Battle_Ping_Info"):
            packet = self.packetManager.get_packet_by_name("Battle_Ping_Sync")()
            packet.object['latencyInfo'] = {
                'clientTime': self.client_time,
                'serverSessionTime': packet_obj['latencyInfo']['serverSessionTime']
            }
            packet.deimplement()
            self.send_packet(packet)

        elif self.compare_packet("Tank_Stat_Synced"):
            self.holder.storage['specificationID'] = packet_obj['specificationID']

        elif self.compare_packet("Init_Battle_Stats"):
            self.time_left = packet_obj['timeLeft']

            # Check if we can spawn now
            if self.time_left > 0:
                self.status = Alive_Status.NEW_ENTRY
                self.create_packet_timer(self.status.value, self.packetManager.get_packet_by_name("Death_Delay_End")())
            else:
                # Intermediary sessions are around 10 seconds, just an approximation, can be done with a more specific packet
                self.create_packet_timer(10, self.packetManager.get_packet_by_name("Death_Delay_End")())

        elif self.compare_packet("Left_Team_Battle"):
            # Remove player from the list
            username = packet_obj['username']
            self.players = [player for player in self.players if player.name != username]

            print(username + " has left the team battle.")

        elif self.compare_packet("Player_Start_Position"):
            # We have our new spawn, create a Send_Respawn packet after timer
            self.status = Alive_Status.CHANGING_SPAWN
            self.create_packet_timer(self.status.value, self.packetManager.get_packet_by_name("Send_Respawn")()) # Has no data

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
                self.create_packet_timer(self.status.value, self.packetManager.get_packet_by_name("End_Resp_Fantom")())

        elif self.compare_packet("Fully_Respawned"):
            affected_player = next((player for player in self.players if player.name == packet_obj['username']), None)
            if affected_player:
                affected_player.inresp = False

            if packet_obj['username'] == self.holder.storage['credentials']['username']:
                self.status = Alive_Status.ALIVE

                # Now we can run the main battle loop
                battle_loop = Thread(target=self.exec_battle_loop, name=f"Battle Loop {self.holder.storage['sheep_id']} ({self.holder.storage['credentials']['username']})")
                battle_loop.daemon = True
                battle_loop.start()
                self.threads.add(battle_loop)

                # Also add anti afk loop    
                # Check if threads has this thread already 
                if any(thread.name.startswith(f"Anti AFK {self.holder.storage['sheep_id']}") for thread in self.threads):
                    return
                anti_afk = Thread(target=self.anti_afk, name=f"Anti AFK {self.holder.storage['sheep_id']} ({self.holder.storage['credentials']['username']})")
                anti_afk.daemon = True
                anti_afk.start()
                self.threads.add(anti_afk)

        elif self.compare_packet("Tank_Health"):
            player = next((player for player in self.players if player.name == packet_obj['username']), None)
            if player:
                player.health = packet_obj['health']

        elif self.compare_packet("Kill_Confirm") or self.compare_packet("Self_Destructed"):
            username = packet_obj['target'] if 'target' in packet_obj else packet_obj['username']
            target = next((player for player in self.players if player.name == username), None)
            if not target:
                return
            
            target.inresp = True
            
            if target.name == self.holder.storage['credentials']['username']:
                self.status = Alive_Status.DEAD_DELAY
                self.create_packet_timer(self.status.value, self.packetManager.get_packet_by_name("Death_Delay_End")())

    def exec_battle_loop(self):
        # Hold your horses, after we spawn we wait a second so that every player should have spawned in        
        while self.thread_can_run.is_set() and self.status == Alive_Status.ALIVE:
            # Find my instance
            me = next((player for player in self.players if player.name == self.holder.storage['credentials']['username']), None)
            if not me:
                return
            
            client_time = self.modded_client_time
            
            # Shoot at enemies
            if 'mounted_turret' in self.holder.storage and self.holder.storage['mounted_turret'] == 'smoky_m0' or 'mounted_turret' not in self.holder.storage and self.holder.storage['credentials']['railgun'] < 0:
                enemy = None
                while enemy == None:
                    enemy = max([player for player in self.players if player.team != me.team and not player.inresp], key=lambda x: x.health, default=None)
            
            
                # Shoot at the enemy
                packet = self.packetManager.get_packet_by_name("Smoky_Shoot_Target_OUT")()
                packet.object['clientTime'] = client_time
                packet.object['target'] = enemy.name
                packet.object['incarnationID'] = enemy.incarnation_id
            
                # We do some trolling here
                packet.object['targetBodyPosition'] = {"x": 0, "y": 0, "z": 0}
                packet.object['localHitPoint'] = {"x": 0, "y": 0, "z": 0}
                packet.object['globalHitPoint'] = {"x": 0, "y": 0, "z": 0}
            
                packet.deimplement()
                self.send_packet(packet)
                # print(me, "tries to shoot", enemy)
            
                # Smoky recharge
                time.sleep(1.85)

            else:
                packet = self.packetManager.get_packet_by_name("Railgun_Shot_Init_OUT")()
                packet.object['clientTime'] = client_time
                packet.deimplement()
                self.send_packet(packet)
            
                # Randomize enemy order
                enemies_len = 0
                while enemies_len == 0:
                    enemies: list[Player] = [player for player in self.players if player.team != me.team and not player.inresp]
                    enemies_len = len(enemies)
                    time.sleep(1.17)
                random.shuffle(enemies)
            
                # Shoot at all enemies
                packet = self.packetManager.get_packet_by_name("Railgun_Shot_OUT")()
                packet.object['clientTime'] = self.modded_client_time
                packet.object["incarnationIDs"] = [player.incarnation_id for player in enemies]
                packet.object["targets"] = [player.name for player in enemies]
                packet.object["staticHitPoint"] = {"x": 0, "y": 0, "z": 0}
                packet.object["targetHitPoints"] = [{"x": 0, "y": 0, "z": 0}] * enemies_len
                packet.object["targetBodyPositions"] = [{"x": 0, "y": 0, "z": 0}] * enemies_len
                packet.object["globalHitPoints"] = [{"x": 0, "y": 0, "z": 0}] * enemies_len
            
                packet.deimplement()
                self.send_packet(packet)
                # print(me, "tries to shoot", enemies)
            
                # Smoky recharge
                time.sleep(5.9)

    def anti_afk(self):
        while self.thread_can_run.is_set():
            while self.status != Alive_Status.FANTOM and self.status != Alive_Status.ALIVE:
                time.sleep(1)
                
            # AntiAFK
            packet = self.packetManager.get_packet_by_name("Turret_Control")()
            packet.object['clientTime'] = self.modded_client_time
            packet.object['specificationID'] = self.holder.storage['specificationID']
            packet.object['control'] = random.randint(-128, 127)
            packet.deimplement()
            self.send_packet(packet)

            time.sleep(50)

    def load_garage(self):
        return None
            
        
class Player:
    def __init__(self, name: str, team: int, inresp: bool, incarnation_id: int = None, position: dict[str, float] = None, health: float = 10000):
        object.__setattr__(self, '_lock', Lock())
        
        self.name = name
        self.team = team
        self.inresp = inresp
        self.incarnation_id = incarnation_id
        self.position = position
        self.health = health


    def __setattr__(self, name, value):
        if name == '_lock':
            # Directly set the internal '_lock' attribute without locking
            object.__setattr__(self, name, value)
        else:
            # Acquire the lock before setting any other attribute
            with self._lock:
                object.__setattr__(self, name, value)

    def __getattr__(self, name):
        # This method is only called if normal attribute access fails
        # To avoid recursion, use object.__getattribute__ directly
        if name == '_lock':
            return object.__getattribute__(self, name)
        with self._lock:
            return object.__getattribute__(self, name)

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