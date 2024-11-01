from packets.network import *
from packets.entry import *
from packets.shop import *
from packets.lobby import *
from packets.chat import *
from packets.online import *
from packets.battle_info import *
from packets.battle_mechanics import *
from packets.turrets import *

class Packets:
    # Network
    Activate_Protection = Activate_Protection
    Ping = Ping
    Pong = Pong

    # Entry
    Load_Resources = Load_Resources
    Resources_Loaded = Resources_Loaded
    Invite_Code_Status = Invite_Code_Status
    Login_Ready = Login_Ready
    Login = Login
    Login_Success = Login_Success
    Login_Failed = Login_Failed

    # Shop
    Send_Promocode = Send_Promocode
    Promocode_Success = Promocode_Success
    Promocode_Failed = Promocode_Failed

    # Lobby Battle
    Select_Battle = Select_Battle
    Join_Battle = Join_Battle
    Left_Battle = Left_Battle
    Check_Battle_Name = Check_Battle_Name
    Create_Battle = Create_Battle
    Battle_Created = Battle_Created
    Load_Battle_Info = Load_Battle_Info
    Update_Preview_Battle_Player_Score = Update_Preview_Battle_Player_Score

    # Chat
    Send_Lobby_Chat = Send_Lobby_Chat
    Receive_Lobby_Chat = Receive_Lobby_Chat
    Send_Game_Chat = Send_Game_Chat
    Receive_Game_Chat = Receive_Game_Chat
    Wipe_Lobby_Messages = Wipe_Lobby_Messages

    # Online Status
    Player_Online = Player_Online
    Load_Player_Rank = Load_Player_Rank

    # Battle Info
    Tank_Health = Tank_Health
    Tank_Damage = Tank_Damage
    Kill_Confirm = Kill_Confirm
    Update_Battle_Player_Statistics = Update_Battle_Player_Statistics
    Battle_Ping_Info = Battle_Ping_Info

    # Battle Mechanics
    Move_IN = Move_IN
    Move_OUT = Move_OUT
    Rotate_Turret_IN = Rotate_Turret_IN
    Rotate_Turret_OUT = Rotate_Turret_OUT

    Freeze_Start_OUT = Freeze_Start_OUT
    Freeze_End_OUT = Freeze_End_OUT
    
    Shaft_Arcade_OUT = Shaft_Arcade_OUT
    Shaft_Scope_OUT = Shaft_Scope_OUT

    # Joined_Battle = -1895446889 # (Think this is wrong)

    # Turret Mechanics (OUT)

    # Isida_OUT = 381067984
    # Hammer_OUT = -541655881
    # Shaft_Laser_Horizontal_OUT = -1749108178
    # Shaft_Laser_Vertical_OUT = 1224288585

    # Supplies

    # Use_Supply_OUT = -2102525054
    # Supply_Box_Drop = 1831462385
    # Take_Supply_Box = -1047185003
    # Supply_Box_Taken = -1291499147
    # Add_Supply_Effect = -1639713644

    @staticmethod
    def get_packet(packet_id: int):
        for name, value in Packets.__dict__.items():
            if not name.startswith('_') and value == packet_id:
                return value

    @staticmethod
    def get_name(packet_id: int) -> str:
        for name, value in Packets.__dict__.items():
            if not name.startswith('_') and value == packet_id:
                return name
        return "Unknown"
    
