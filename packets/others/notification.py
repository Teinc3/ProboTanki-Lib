from lib.codec.primitive import BoolCodec
from lib.packets.abstractpacket import AbstractPacket


class Settings_Notification(AbstractPacket):
    id = 1447082276
    description = "Check if the user has notification on"
    codecs = [BoolCodec]
    attributes = ['notificationEnabled']
