import os
import json
import asyncio
from threading import Thread
from nextcord.ext import commands
from nextcord import Message, TextChannel, Intents
from dotenv import load_dotenv, find_dotenv

load_dotenv(find_dotenv())

BOT_TOKEN = os.environ.get("DISCORD_BOT_TOKEN")
LOG_CHANNELS_FILE = os.path.abspath(
    os.path.join(os.path.dirname(__file__), '..', '..', '..', 'data', 'discord', 'channels.json')
)

class DiscordManager(commands.Bot):
    _instance = None

    CHANNEL_TYPE_MAPPING = {
        0: 'name',
        1: 'helper',
        2: 'mod',
        3: 'bot',
        4: 'error'
    }

    def __new__(cls, *args, **kwargs):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance

    def __init__(self, *args, **kwargs):
        if not hasattr(self, '_initialized'):
            super().__init__(*args, **kwargs)
            self.log_channels = {}
            self.cached_log_msg: dict[int, Message] = {
                1: None,
                2: None,
            }
            self.load_log_channels()
            self._initialized = True

    def load_log_channels(self):
        if not os.path.exists(LOG_CHANNELS_FILE):
            print(f"Log channels file not found: {LOG_CHANNELS_FILE}")
            return
        with open(LOG_CHANNELS_FILE, 'r') as f:
            self.log_channels: dict[str, int] = json.load(f)
        if not self.log_channels:
            print("Log Channels file is empty")

    async def log_msg(self, channel_type: int, text: str = None, payload: dict = None):
        channel_name = self.CHANNEL_TYPE_MAPPING.get(channel_type)
        if not channel_name:
            print(f"Invalid channel type {channel_type}")
            return

        if self.cached_log_msg[channel_type]:
            # Modify the cached msg instead of sending a new one
            await self.edit_logged_msg(self.cached_log_msg[channel_type], text, payload)
            return

        channel_id = self.log_channels.get(channel_name)
        if not channel_id:
            print(f"Channel {channel_name} not found")
            return

        channel: TextChannel = await self.fetch_channel(channel_id)
        if not channel:
            print(f"Channel {channel_name} not found")
            return

        if text and payload:
            await channel.send(text, embed=payload)
        elif text:
            await channel.send(text)
        elif payload:
            await channel.send(embed=payload)

    async def edit_logged_msg(self, cached_msg: Message, text: str, payload: dict):
        # Safely handle if there are no embeds
        if not cached_msg.embeds:
            old_description = ""
        else:
            old_description = cached_msg.embeds[0].description or ""

        # Add the existing description to the back of the description in the new payload
        # Make sure it does not exceed 3 lines
        new_description = f"{old_description}\n{payload.get('description', '')}"
        if len(new_description.split('\n')) > 3:
            new_description = '\n'.join(new_description.split('\n')[:3])

        payload['description'] = new_description
        await cached_msg.edit(content=text, embed=payload)

def run_discord_bot():
    """
    This function runs the Discord bot on a separate thread
    without causing the 'coroutine was never awaited' or
    'set_wakeup_fd only works in main thread' errors.
    """
    
    # 1) (Optional) Disable signal handling so we don't get 'set_wakeup_fd' errors
    class NoSignalLoopPolicy(asyncio.DefaultEventLoopPolicy):
        def set_wakeup_fd(self, fd):
            # Override to do nothing
            pass

    asyncio.set_event_loop_policy(NoSignalLoopPolicy())

    # 2) Create a new event loop for this thread
    loop = asyncio.new_event_loop()
    asyncio.set_event_loop(loop)

    # 3) Create your bot instance
    bot = DiscordManager(
        command_prefix="!",            # or whatever prefix you want
        intents=Intents.all()          # or whichever Intents you need
    )

    # 4) Run the bot within the event loop
    try:
        # bot.start(...) is a coroutine; we run it on our custom loop
        loop.run_until_complete(bot.start(BOT_TOKEN))
    except KeyboardInterrupt:
        # Allow a graceful shutdown
        loop.run_until_complete(bot.close())
    finally:
        loop.close()

# Start the bot on a separate (daemon) thread
Thread(target=run_discord_bot, daemon=False).start()

# Join the main thread to keep the bot running

