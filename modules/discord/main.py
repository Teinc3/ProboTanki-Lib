import os
from dotenv import load_dotenv, find_dotenv
from nextcord.ext import commands

load_dotenv(find_dotenv())

BOT_TOKEN = os.environ.get('DISCORD_BOT_TOKEN')


# Singleton class, as we can only run one instance of the bot at a time
class DiscordBot:
    _instance = None

    def __new__(cls, *args, **kwargs):
        if not cls._instance:
            cls._instance = super(DiscordBot, cls).__new__(cls)
        return cls._instance

    def __init__(self, token: str, prefix: str):
        self.bot = commands.Bot(command_prefix=prefix)
        self.token = token

    def run(self):
        self.bot.run(self.token)

if __name__ == "__main__":
    DiscordBot(BOT_TOKEN, prefix='!').run()