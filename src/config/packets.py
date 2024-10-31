class Packets():
    Activate_Protection = 2001736388
    Ping = -555602629
    Pong = 1484572481

    Load_Resources = -1797047325
    Resources_Loaded = -82304134
    Invite_Code_Active = 444933603
    Login_Ready = -1277343167

    Login = -739684591
    Login_Success = -1923286328
    Login_Failed = 103812952

    Joined_Battle = -1895446889 
    Left_Battle = 1941694508
    Create_Battle = -2135234426
    Battle_Created = 802300608 # For all new battles, not just ones you create
    Load_Battle_Info = 546722394
    Update_Battle_Player_Score = -375282889

    # Chat
    Send_Lobby_Chat = 705454610
    Receive_Lobby_Chat = -1263520410
    Send_Game_Chat = 945463181
    Receive_Game_Chat = 1259981343
    Wipe_Lobby_Messages = 1993050216

    Player_Online = 2041598093
    Load_Player_Rank = -962759489

    Move = -64696933
    Rotate_Turret = 1927704181

    @staticmethod
    def get_name(packet_id: int) -> str:
        for name, value in Packets.__dict__.items():
            if not name.startswith('_') and value == packet_id:
                return name
        return "Unknown"