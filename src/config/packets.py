class Packets:
    # Network
    Activate_Protection = 2001736388
    Ping = -555602629
    Pong = 1484572481

    # Loading
    Load_Resources = -1797047325
    Resources_Loaded = -82304134
    Invite_Code_Active = 444933603
    Login_Ready = -1277343167

    # Login
    Login = -739684591
    Login_Success = -1923286328
    Login_Failed = 103812952

    # Promocodes
    Send_Promocode = -511004908
    Promocode_Success = -1859441081
    Promocode_Failed = -1850050333

    # Lobby Battle
    Select_Battle = 2092412133 # Both IN and OUT - IN means selection successful
    Join_Battle = -1284211503
    Joined_Battle = -1895446889
    Left_Battle = 1941694508
    Create_Battle = -2135234426
    Battle_Created = 802300608  # For all new battles, not just ones you create
    Load_Battle_Info = 546722394
    Update_Preview_Battle_Player_Score = -375282889

    # Chat
    Send_Lobby_Chat = 705454610
    Receive_Lobby_Chat = -1263520410
    Send_Game_Chat = 945463181
    Receive_Game_Chat = 1259981343
    Wipe_Lobby_Messages = 1993050216

    # Online Status
    Player_Online = 2041598093
    Load_Player_Rank = -962759489

    # Battle Info
    Tank_Health = -611961116
    Shot_Damage = -1165230470
    Kill_Confirm = -42520728
    Update_Battle_Player_Statistics = 696140460
    Battle_Ping_Info = 34068208

    # Battle Mechanics
    Move_IN = -64696933
    Move_OUT = 329279865
    Rotate_Turret_IN = 1927704181 # Only IN
    Rotate_Turret_OUT = -114968993

    # Turret Mechanics (OUT)
    Hammer_OUT = -541655881
    Isida_OUT = 381067984
    Shaft_Arcade_OUT = -2030760866
    Shaft_Scope_OUT = 1632423559
    Shaft_Laser_Horizontal_OUT = -1749108178
    Shaft_Laser_Vertical_OUT = 1224288585

    # Supplies
    Use_Supply_OUT = -2102525054
    Supply_Box_Drop = 1831462385
    Take_Supply_Box = -1047185003
    Supply_Box_Taken = -1291499147
    Add_Supply_Effect = -1639713644

    @staticmethod
    def get_name(packet_id: int) -> str:
        for name, value in Packets.__dict__.items():
            if not name.startswith('_') and value == packet_id:
                return name
        return "Unknown"
