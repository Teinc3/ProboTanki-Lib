from abc import ABC, abstractmethod
import asyncio
import datetime
from typing import Callable, Generic, TypeVar, Awaitable

from ...packets import AbstractPacket
from ..misc import packetManager
from ..communications import AbstractMessage, LogMessage
from .asynctarget import ATarget as Target
from ...utils.enums import LogChannelType

SpecificLogChannelType = TypeVar('SpecificLogChannelType', bound=LogChannelType)


class AsyncBaseTracker(ABC, Generic[SpecificLogChannelType]):
    """Abstract base class for tracking different types of accounts with async support."""

    def __init__(
        self,
        send_packet: Callable[[AbstractPacket], Awaitable[None]],
        transmit: Callable[[AbstractMessage], Awaitable[None]]
    ):
        self.transmit = transmit
        self.send_packet = send_packet

        self.targets: dict[str, Target] = {}
        self.names: list[str] = []
        self.status_received_count = 0
        self._finalize_task: asyncio.Task | None = None

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
    
    @abstractmethod
    def evaluate_availability(self) -> tuple[list[Target], list[Target]]:
        """Evaluate availability based on specific criteria."""
        raise NotImplementedError

    @abstractmethod
    def construct_payload(self, online: list[Target], available: list[Target]) -> dict:
        """Construct the Discord embed payload."""
        raise NotImplementedError


    async def subscribe_names(self, names_list: list[str]):
        """Subscribe to the list of names."""

        Packet = packetManager.get_packet_by_name('Subscribe_Status')

        for name in names_list:
            self.targets[name] = Target(name)
            
            packet = Packet()
            packet.objects = [name]
            await self.send_packet(packet)

        await self.set_finalize_timer()

    async def handle_status_change(self, username: str, online_status: bool | None = None, battle_status: str | None = None):
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
                await self.finalize_tracker_list()
                await self.set_finalize_timer(cancel_timer=True)
            return
        
        await self.push_status_update(username, target, (old_online_status, old_battle_status))

    async def set_finalize_timer(self, cancel_timer: bool = False):
        """Set/reset the finalize timer."""
        # Cancel existing task if it exists
        if self._finalize_task and not self._finalize_task.done():
            self._finalize_task.cancel()
            try:
                await self._finalize_task
            except asyncio.CancelledError:
                pass
            self._finalize_task = None

        if cancel_timer:
            return
            
        # Create a new finalize task
        self._finalize_task = asyncio.create_task(self._finalize_after_delay())

    async def _finalize_after_delay(self):
        """Wait for the timer duration then finalize"""
        try:
            await asyncio.sleep(self.timer_duration)
            await self.finalize_tracker_list()
        except asyncio.CancelledError:
            # Task was cancelled, no need to finalize
            pass

    async def finalize_tracker_list(self):
        """Finalize the list by removing invalid entries."""
        # Find invalid names
        invalid_names = [
            name for name, target in self.targets.items() 
            if not target.online_status_recv
        ]
        
        # Remove invalid targets
        for name in invalid_names:
            if name in self.targets:
                del self.targets[name]
        
        # Update status received count
        self.status_received_count = len(self.targets)

        # For the rest of the names, we give them battle status of '' if nanes mode is False
        for target in self.targets.values():
            if not target.names_mode and not target.battleID:
                target.battleID = ''

        await self.craft_payload()

    async def craft_payload(self, push_init_status: bool = True) -> dict:
        """Push the initial status to the log channel."""
        online, available = self.evaluate_availability()
        payload = self.construct_payload(online, available)

        if push_init_status:  # If this is the first time
            payload['description'] = f"<t:{round(datetime.datetime.now().timestamp())}:R>: Tracker started."
            await self.log_msg(payload=payload)
        return payload
    
    async def push_status_update(self, username: str, target: Target, old_status: tuple[bool, str]):
        """Send a Discord embed update for status changes."""
        
        payload = await self.craft_payload(push_init_status=False)

        status_text = ''
        if target.online != old_status[0]:
            status_text = f"*{username}* -> {'Online' if target.online else 'Offline'}"

        elif target.battleID != old_status[1]:
            status_text = f"*{username}* -> {'In Public Battle (' + target.battleID + ')' if target.battleID else 'Left Public Battle'}"

        elif target.online:  # Status update for leaving private battle
            status_text = f"*{username}* -> Left Private/Spectator Battle"

        else:  # Nothing worth pushing
            return

        payload['description'] += f"<t:{round(datetime.datetime.now().timestamp())}:R>: {status_text}"
        await self.log_msg(payload=payload)

    async def log_msg(self, text: str = None, payload: dict = None):
        """Log a message to the Discord channel."""

        message = LogMessage(channel_type=self.channel_type, text=text, payload=payload)
        await self.transmit(message)
    

__all__ = ['AsyncBaseTracker']