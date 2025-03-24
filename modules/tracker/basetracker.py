from abc import ABC, abstractmethod
import datetime
from threading import Lock, Timer
from typing import Callable, Generic, TypeVar

from ...packets import AbstractPacket
from ..misc import packetManager
from ..communications import LogMessage
from .target import Target
from ...utils.enums import LogChannelType

SpecificLogChannelType = TypeVar('SpecificLogChannelType', bound=LogChannelType)


class BaseTracker(ABC, Generic[SpecificLogChannelType]):
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

    def subscribe_names(self, names_list: list[str]):
        """Subscribe to the list of names."""

        Packet = packetManager.get_packet_by_name('Subscribe_Status')

        for i in range(len(names_list)):
            name = names_list[i]
            self.targets[name] = Target(name)
            
            packet = Packet()
            packet.objects = [name]
            self.send_packet(packet)

        self.set_finalize_timer()

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
                self.set_finalize_timer(True)
            return
        
        self.push_status_update(username, target, (old_online_status, old_battle_status))

    def set_finalize_timer(self, cancel_timer: bool = False):
        """Set/reset the finalize timer."""

        if self.finalize_timer and self.finalize_timer.is_alive():
            self.finalize_timer.cancel()

        if cancel_timer:
            return
        self.finalize_timer = Timer(self.timer_duration, self.finalize_tracker_list)
        self.finalize_timer.start()

    def finalize_tracker_list(self):
        """Finalize the list by removing invalid entries."""

        invalid_names = [name for name, target in self.targets.items() if not target.online_status_recv]
        for name in invalid_names:
            self.targets.pop(name, None)

        self.status_received_count = len(self.targets)

        # For the rest of the names, we give them battle status of '' if nanes mode is False
        for target in self.targets.values():
            if not target.names_mode and not target.battleID:
                target.battleID = ''

        self.craft_payload()

    def craft_payload(self, push_init_status: bool = True) -> dict | None:
        """Push the initial status to the log channel."""
        online, available = self.evaluate_availability()
        payload = self.construct_payload(online, available)

        if push_init_status: # If this is the first time
            payload['description'] = f"<t:{round(self.get_utc_time.timestamp())}:R>: Tracker started."
            self.log_msg(payload=payload)
        return payload
    
    def push_status_update(self, username: str, target: Target, old_status: tuple[bool, str]):
        """Send a Discord embed update for status changes."""
        payload = self.craft_payload(push_init_status=False)

        status_text = ''
        if target.online != old_status[0]:
            status_text = f"*{username}* -> {'Online' if target.online else 'Offline'}"

        elif target.battleID != old_status[1]:
            status_text = f"*{username}* -> {'In Public Battle (' + target.battleID + ')' if target.battleID else 'Left Public Battle'}"

        elif target.online: # Thank you RIOT for spamming this not in battle status even when you are fucking offline
            status_text = f"*{username}* -> Left Private/Spectator Battle"

        else: # Nth worthy to push
            return

        payload['description'] += f"<t:{round(self.get_utc_time.timestamp())}:R>: {status_text}"
        self.log_msg(payload=payload)

    def log_msg(self, text: str = None, payload: dict = None):
        """Log a message to the Discord channel."""

        message = LogMessage(channel_type=self.channel_type, text=text, payload=payload)
        self.transmit(message)
        
    @abstractmethod
    def evaluate_availability(self) -> tuple[list[Target], list[Target]]:
        """Evaluate availability based on specific criteria."""
        raise NotImplementedError

    @abstractmethod
    def construct_payload(self, online: list[Target], available: list[Target]) -> dict:
        """Construct the Discord embed payload."""
        raise NotImplementedError

    @property
    @abstractmethod
    def channel_type(self) -> SpecificLogChannelType:
        """Return the channel type for logging."""
        raise NotImplementedError
    
    @property
    @abstractmethod
    def timer_duration(self) -> int:
        """Return the duration to finalize timer."""
        raise NotImplementedError