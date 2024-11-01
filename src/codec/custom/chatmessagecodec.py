from codec.base import CustomBaseCodec
from codec.primitive import StringCodec, BoolCodec
from codec.custom.userstatuscodec import UserStatusCodec

class ChatMessageCodec(CustomBaseCodec):
    attributes = ["authorStatus", "systemMessage", "targetStatus", "message", "warning"]
    codecs = [UserStatusCodec, BoolCodec, UserStatusCodec, StringCodec, BoolCodec]