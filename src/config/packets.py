class Packets():
    Activate_Protection = 2001736388
    Ping = -555602629
    Pong = 1484572481

    @staticmethod
    def get_name(packet_id: int) -> str:
        for name, value in Packets.__dict__.items():
            if not name.startswith('_') and value == packet_id:
                return name
        return "Unknown"