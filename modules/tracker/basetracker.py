from abc import ABC, abstractmethod
import datetime
from threading import Lock, Timer
from typing import Callable

from ...packets import AbstractPacket
from ..misc import packetManager
from ..communications import LogMessage
from .target import Target


class BaseTracker(ABC):
    """Abstract base class for tracking different types of accounts."""

    def __init__(self, send_packet: Callable[[AbstractPacket], None], transmit: Callable[[str, str, dict], None]):
        self.transmit = transmit

        self._targets: dict[str, Target] = {}
        self.targets_lock = Lock()
        self.names: list[str] = []
        self.status_received_count = 0
        self.finalize_timer = None
        self.send_packet = send_packet

    @property
    def targets(self) -> dict[str, Target]:
        with self.targets_lock:
            return self._targets
    
    # Usually not needed as we're accessing the dictionary through property
    @targets.setter
    def targets(self, value: dict[str, Target]):
        with self.targets_lock:
            self._targets = value
    
    @property
    def get_utc_time(self) -> datetime.datetime:
        return datetime.datetime.now(datetime.timezone.utc)

    def subscribe_names(self, names_list: list[str], rank_list: list[int] = None):
        """Subscribe to the list of names."""
        Packet = packetManager.get_packet_by_name('Subscribe_Status')

        for i in range(len(names_list)):
            name = names_list[i]
            rank = rank_list[i] if rank_list and rank_list[i] else None
            self.targets[name] = Target(name, names_mode=(self.channel_type == 'names'), rank=rank)
            
            packet = Packet()
            packet.objects = [name]
            self.send_packet(packet)

    def handle_status_change(self, username: str, online_status: bool | None = None, battle_status: str | None = None):
        """Handle incoming status changes."""
        target = self.targets.get(username)
        if not target:
            return

        old_status_recv = target.status_recv
        old_online_status = target.online
        old_battle_status = target.battleID

        if online_status is not None:
            target.online = online_status
        if battle_status is not None:
            target.battleID = battle_status

        if not target.status_recv:
            return
        
        if old_online_status == online_status:
            target.ignore_flag = True
            return
        elif target.ignore_flag:
            target.ignore_flag = False
            return

        if not old_status_recv and target.status_recv:
            self.status_received_count += 1

            all_statuses_recv = self.status_received_count == len(self.targets)
            if all_statuses_recv:
                # Directly finalize the list if all statuses have been received
                self.finalize_tracker_list()

            self.reset_finalize_timer(all_statuses_recv)
            return
        
        self.push_status_update(username, target.online, target.battleID, old_online_status, old_battle_status)

    def reset_finalize_timer(self, cancel: bool = False):
        """Reset the finalize timer."""
        if self.finalize_timer and self.finalize_timer.is_alive():
            self.finalize_timer.cancel()

        if cancel:
            return
        self.finalize_timer = Timer(self.timer_duration, self.finalize_tracker_list)
        self.finalize_timer.start()

    def finalize_tracker_list(self):
        """Finalize the list by removing invalid entries."""
        invalid_names = [name for name, target in self.targets.items() if not target.status_recv]
        for name in invalid_names:
            self.targets.pop(name, None)
        self.craft_payload()

    def craft_payload(self, push_init_status: bool = True) -> dict | None:
        """Push the initial status to the log channel."""
        online, available = self.evaluate_availability()
        payload = self.construct_payload(online, available)

        if push_init_status: # If this is the first time
            payload['description'] = f"<t:{round(self.get_utc_time.timestamp())}:R>: Tracker started."
            self.log_msg(self.channel_type, payload=payload)
        return payload
    
    def push_status_update(self, username: str, online_status: bool, battle_status: str, old_online_status: bool, old_battle_status: str):
        """Send a Discord embed update for status changes."""
        payload = self.craft_payload(push_init_status=False)

        status_text = ''
        if online_status != old_online_status:
            status_text = f"*{username}* -> {'Online' if online_status else 'Offline'}"
        elif battle_status != old_battle_status:
            status_text = f"*{username}* -> {'In Public Battle (' + battle_status + ')' if battle_status else 'Left Public Battle'}"
        else:
            status_text = f"*{username}* -> Left Private/Spectator Battle"

        payload['description'] += f"<t:{round(self.get_utc_time.timestamp())}:R>: {status_text}"
        self.log_msg(self.channel_type, payload=payload)

    def log_msg(self, message_type: str, text: str = None, payload: dict = None):
        """Log a message to the Discord channel."""

        message = LogMessage(message_type, text=text, payload=payload)
        self.transmit(message)

        if self.channel_type == 'mod': # If channel_type is mod then we also have to send the payload to the mod_dynamic channel
            message.channel_type = 'mod_dynamic'
            self.transmit(message)
        
    @abstractmethod
    def evaluate_availability(self) -> tuple[list[Target], list[Target]]:
        """Evaluate availability based on specific criteria."""
        return NotImplementedError

    @abstractmethod
    def construct_payload(self, online: list[Target], available: list[Target]) -> dict:
        """Construct the Discord embed payload."""
        return NotImplementedError

    @property
    @abstractmethod
    def channel_type(self) -> str:
        """Return the channel type for logging."""
        return NotImplementedError
    
    @property
    @abstractmethod
    def timer_duration(self) -> int:
        """Return the duration to finalize timer."""
        return NotImplementedError