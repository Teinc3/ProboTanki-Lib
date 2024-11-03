from codec.base import CustomBaseCodec
from codec.complex import StringCodec
from codec.custom.userstatuscodec import UserStatusCodec
from codec.primitive import BoolCodec


class ChatMessageCodec(CustomBaseCodec):
    attributes = ["authorStatus", "systemMessage", "targetStatus", "message", "warning"]
    codecs = [UserStatusCodec, BoolCodec, UserStatusCodec, StringCodec, BoolCodec]
