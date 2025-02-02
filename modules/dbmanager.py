import datetime
import os
import sqlite3
import queue
import threading

from lib.utils.normalizer import normalize_name

DB_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'data', 'db', 'database.sqlite'))
COMMANDS_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'data', 'db', 'commands.sql'))


class DBManager:
    conn: sqlite3.Connection
    cursor: sqlite3.Cursor

    def db_task(method):
        def wrapper(self, *args, **kwargs):
            return self._run_task(method, self, *args, **kwargs)
        return wrapper

    def __init__(self):
        # Create a task queue that will hold DB work to be executed in our worker thread.
        self._task_queue = queue.Queue()
        self._worker_thread = threading.Thread(target=self._worker, daemon=True)

        # _init_db_done will signal when the connection has been created.
        self._init_db_done = threading.Event()
        self._worker_thread.start()

        # Schedule DB initialization in the worker thread.
        self._run_task(self._init_db)
    
    def _worker(self):
        """Continuously execute tasks from the queue in this thread."""
        while True:
            task = self._task_queue.get()
            if task is None:
                break  # Exit signal
            func, args, kwargs, result_queue = task
            try:
                result = func(*args, **kwargs)
                result_queue.put(result)
            except Exception as ex:
                result_queue.put(ex)
    
    def _run_task(self, func, *args, **kwargs):
        """Schedules a task and waits for its result."""
        result_queue = queue.Queue(maxsize=1)
        self._task_queue.put((func, args, kwargs, result_queue))
        result = result_queue.get()
        if isinstance(result, Exception):
            raise result
        return result

    def _init_db(self):
        """Initialize the DB connection and extract tables. This runs in the worker thread."""
        self.conn = sqlite3.connect(DB_PATH)
        self.cursor = self.conn.cursor()
        self._extract_tables()
        self.conn.commit()
        self._init_db_done.set()
    
    def _extract_tables(self):
        lines = []
        with open(COMMANDS_PATH, 'r') as f:
            lines = f.read().split("\n")
        if not lines:
            raise Exception("No commands found in the commands file")
        
        self.table_names = {}
        i = 0
        while i < len(lines):
            line = lines[i]
            if line.startswith("CREATE TABLE IF NOT EXISTS"):
                command = line
                table_name = line.replace("CREATE TABLE IF NOT EXISTS ", '').replace(" (", '')
                i += 1
                while i < len(lines) and not lines[i].startswith(");"):
                    command += lines[i]
                    i += 1
                self.table_names[table_name] = command + ");"
            i += 1

        for table_name, command in self.table_names.items():
            self.cursor.execute(command)

    # ----- Tracking Methods -----
    def _check_tracking(self, user_id: int, name: str) -> bool:
        """Internal method to check if a tracking entry exists."""
        self.cursor.execute("SELECT COUNT(*) FROM TRACKING WHERE NAME=? AND USERID=?", (name, user_id))
        return self.cursor.fetchone()[0] > 0
    
    @db_task
    def check_tracking(self, user_id: int, name: str) -> bool:
        """Public method to check if a user is tracking a name."""
        name = normalize_name(name)
        return self._check_tracking(user_id, name)
    
    @db_task
    def get_name_trackers(self, name: str) -> list[str]:
        """Get the user ids of all users tracking a name"""
        name = normalize_name(name)
        self.cursor.execute("SELECT USERID FROM TRACKING WHERE NAME=?", (name, ))
        return [row[0] for row in self.cursor.fetchall()]

    @db_task
    def track_name(self, user_id: int, name: str):
        """Add a user to the tracking list for a name, if not already tracked."""
        name = normalize_name(name)
        if self._check_tracking(user_id, name):
            return
        self.cursor.execute("INSERT INTO TRACKING (NAME, USERID) VALUES (?, ?)", (name, user_id))
        self.conn.commit()

    @db_task
    def untrack_name(self, user_id: int, name: str):
        """Remove a user from the tracking list for a name"""
        name = normalize_name(name)
        self.cursor.execute("DELETE FROM TRACKING WHERE NAME=? AND USERID=?", (name, user_id))
        self.conn.commit()

    @db_task
    def add_log_channel(self, guild_id: int, channel_id: int, channel_type: str):
        """Add a channel to the log channels"""
        channel_type = channel_type.upper()
        self.cursor.execute("SELECT COUNT(*) FROM LOGCHANNELS WHERE GUILDID=?", (guild_id, ))
        if self.cursor.fetchone()[0] == 0:
            self.cursor.execute(f"INSERT INTO LOGCHANNELS (GUILDID, {channel_type}) VALUES (?, ?)", (guild_id, channel_id))
        else:
            self.cursor.execute(f"UPDATE LOGCHANNELS SET {channel_type}=? WHERE GUILDID=?", (channel_id, guild_id))
        self.conn.commit()

    @db_task
    def remove_log_channel(self, guild_id: int, channel_type: str):
        """Remove a channel from the log channels"""
        channel_type = channel_type.upper()
        self.cursor.execute(f"UPDATE LOGCHANNELS SET {channel_type}=NULL WHERE GUILDID=?", (guild_id, ))
        self.conn.commit()

    @db_task
    def get_guild_log_channels(self, guild_id: int) -> dict:
        """Get all log channels for a guild"""
        self.cursor.execute("SELECT * FROM LOGCHANNELS WHERE GUILDID=?", (guild_id, ))
        channels = self.cursor.fetchone()
        return {
            "Dynamic Mod Status": channels[1],
            "Mod Tracker": channels[2],
            "Helper Tracker": channels[3]
        }

    @db_task
    def get_log_channels(self, channel_type: str) -> list[int]:
        """Get all log channels for a channel type"""
        channel_type = channel_type.upper()
        self.cursor.execute(f"SELECT {channel_type} FROM LOGCHANNELS WHERE {channel_type} IS NOT NULL")
        return [row[0] for row in self.cursor.fetchall()]

    @db_task
    def subscribe_name(self, name: str, rank: int = None):
        """Subscribe to a name for tracking"""
        name = normalize_name(name)
        current_time = int(datetime.datetime.now().timestamp())
        self.cursor.execute("INSERT INTO NAMES (NAME, RANK, LASTONLINE) VALUES (?, ?, ?)", (name, rank, current_time))
        self.conn.commit()

    @db_task
    def get_names(self) -> list[dict]:
        """Get all names being tracked"""
        self.cursor.execute("SELECT * FROM NAMES")
        return [{"name": row[0], "rank": row[1], "lastonline": row[2]} for row in self.cursor.fetchall()]
    
    @db_task
    def get_trackable_names(self) -> list[dict]:
        """Get all names that can be tracked"""
        # Conditions for a name to be trackable:
        # Rank is not 0 or > 7 (NULL is ok, as it means we don't have the rank tracked yet)
        # Lastonline is not null (if it is, it means we disabled tracking for it)
        self.cursor.execute("SELECT * FROM NAMES WHERE (RANK IS NULL OR (RANK > 0 AND RANK <= 7)) AND LASTONLINE IS NOT NULL")
        return [{"name": row[0], "rank": row[1], "lastonline": row[2]} for row in self.cursor.fetchall()]

    @db_task
    def get_name(self, name: str) -> dict:
        """Get the record for a specific name"""
        name = normalize_name(name)
        self.cursor.execute("SELECT * FROM NAMES WHERE NAME=?", (name, ))
        row = self.cursor.fetchone()
        if not row:
            return None
        return {"name": row[0], "rank": row[1], "lastonline": row[2]}

    @db_task
    def remove_name(self, name: str):
        """
        Remove a name from tracking.
        Note that this only sets LASTONLINE to Null which blocks the name from being tracked.
        The name still remains in the DB.
        """
        name = normalize_name(name)
        self.cursor.execute("UPDATE NAMES SET LASTONLINE=NULL WHERE NAME=?", (name, ))
        self.conn.commit()

    @db_task
    def delete_name(self, name: str):
        """Deletes a name from the database"""
        name = normalize_name(name)
        self.cursor.execute("DELETE FROM NAMES WHERE NAME=?", (name, ))
        self.conn.commit()

    @db_task
    def update_name(self, name: str, rank: int = None, update_online: bool = False):
        """
        Update the name record.
          - If rank is not None, update the RANK column.
          - If update_online is True, update the LASTONLINE column.
        """
        name = normalize_name(name)
        columns = []
        params = []
        if rank is not None:
            columns.append("RANK=?")
            params.append(rank)
        if update_online:
            columns.append("LASTONLINE=?")
            params.append(int(datetime.datetime.now().timestamp()))
        if columns:
            sql = "UPDATE NAMES SET " + ", ".join(columns) + " WHERE NAME=?"
            params.append(name)

            try:
                self.cursor.execute(sql, tuple(params))
                self.conn.commit()
            except Exception as e:
                print(e)

    @db_task
    def set_rank_if_null(self, name: str, rank: int):
        """Update the rank for a name only if the existing rank is null."""
        name = normalize_name(name)
        self.cursor.execute("UPDATE NAMES SET RANK=? WHERE NAME=? AND RANK IS NULL", (rank, name))
        self.conn.commit()

    @db_task
    def close(self):
        """Gracefully close the connection and stop the worker thread."""
        if self.cursor:
            self.cursor.close()
        if self.conn:
            self.conn.close()
        # Send a None task to signal the worker to exit.
        self._task_queue.put(None)