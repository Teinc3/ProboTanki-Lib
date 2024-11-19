from codec.base import CustomBaseCodec
from codec.primitive import BoolCodec
from codec.complex import StringCodec
from .userstatuscodec import UserStatusCodec


class ChatMessageCodec(CustomBaseCodec):
    attributes = ["authorStatus", "systemMessage", "targetStatus", "message", "warning"]
    codecs = [UserStatusCodec, BoolCodec, UserStatusCodec, StringCodec, BoolCodec]
