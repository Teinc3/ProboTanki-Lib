import os
import sqlite3

DB_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'data', 'db', 'database.sqlite'))
COMMANDS_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'data', 'db', 'commands.sql'))


class DBManager:

    def __init__(self):
        self.conn = sqlite3.connect(DB_PATH)
        self.cursor = self.conn.cursor()
        self.extract_tables()

    def extract_tables(self):
        lines = []
        with open(COMMANDS_PATH, 'r') as f:
            # Extract Table Creation commands from the file
            # starts with CREATE TABLE, ew );
            lines = f.read().split("\n")
        if not lines:
            raise Exception("No commands found in the commands file")
        
        self.table_names = {}
        for i in range(len(lines)): # Don't use enumerate because we need to skip lines
            line = lines[i]
            if line.startswith("CREATE TABLE"):
                command = line
                table_name = line.split(" ")[2] # Extract the table name
                i += 1
                while not lines[i].startswith(");"):
                    command += lines[i]
                    i += 1
                self.table_names[table_name] = command + ");"

        # Run the commands (They should create the tables if they DNE, otherwise do nothing)
        for table_name, command in self.table_names.items():
            self.cursor.execute(command)

        self.conn.commit()

    def get_name_trackers(self, name: str) -> list[str]:
        """Get the user ids of all users tracking a name"""

        self.cursor.execute("SELECT USERID FROM TRACKING WHERE NAME=?", (name, ))
        return [row[0] for row in self.cursor.fetchall()]
    
    def track_name(self, user_id: int, name: str):
        """Add a user to the tracking list for a name"""

        self.cursor.execute("INSERT INTO TRACKING (NAME, USERID) VALUES (?, ?)", (name, user_id))
        self.conn.commit()

    def untrack_name(self, user_id: int, name: str):
        """Remove a user from the tracking list for a name"""

        self.cursor.execute("DELETE FROM TRACKING WHERE NAME=? AND USERID=?", (name, user_id))
        self.conn.commit()

    def add_log_channel(self, guild_id: int, channel_id: int, channel_type: str):
        """Add a channel to the log channels"""

        # Upper case the channel type (so mod_dynamic becomes MOD_DYNAMIC etc.)
        channel_type = channel_type.upper()

        # Then check if the guild already has an entry in the db (if not, insert one, then update it)
        self.cursor.execute("SELECT COUNT(*) FROM LOGCHANNELS WHERE GUILDID=?", (guild_id, ))
        if self.cursor.fetchone()[0] == 0:
            # mf its not like i don't wanna use parameters but they dont allow u to put them in cols
            self.cursor.execute(f"INSERT INTO LOGCHANNELS (GUILDID, {channel_type}) VALUES (?, ?)", (guild_id, channel_id))
        else:
            self.cursor.execute(f"UPDATE LOGCHANNELS SET {channel_type}=? WHERE GUILDID=?", (channel_id, guild_id))

    def remove_log_channel(self, guild_id: int, channel_type: str):
        """Remove a channel from the log channels"""

        channel_type = channel_type.upper()
        self.cursor.execute(f"UPDATE LOGCHANNELS SET {channel_type}=NULL WHERE GUILDID=?", (guild_id, ))

    def get_guild_log_channels(self, guild_id: int):
        """Get all log channels for a guild"""

        self.cursor.execute("SELECT * FROM LOGCHANNELS WHERE GUILDID=?", (guild_id, ))
        return self.cursor.fetchone()
    
    def get_log_channels(self, channel_type: str) -> list[int]:
        """Get all log channels for a channel type"""

        channel_type = channel_type.upper()
        self.cursor.execute(f"SELECT {channel_type} FROM LOGCHANNELS WHERE {channel_type} IS NOT NULL")
        return [row[0] for row in self.cursor.fetchall()]
    
    def close(self):
        if self.cursor:
            self.cursor.close()
        if self.conn:
            self.conn.close()